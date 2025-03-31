import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/learning_plan.dart';
import '../bloc/learning_plan_bloc.dart';
import '../theme/app_colors.dart';
import '../../injection.dart';

class LearningPlanPage extends StatefulWidget {
  final LearningPlan? initialPlan;

  const LearningPlanPage({super.key, this.initialPlan});

  @override
  State<LearningPlanPage> createState() => _LearningPlanPageState();
}

class _LearningPlanPageState extends State<LearningPlanPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late DateTime _startDate;
  late DateTime _endDate;
  late int _targetCharacters;
  late Duration _targetStudyTime;
  final List<String> _selectedCategories = [];
  late LearningPlanBloc _learningPlanBloc;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _initializeFields();
    _learningPlanBloc = getIt<LearningPlanBloc>();
  }

  void _initializeFields() {
    final plan = widget.initialPlan;
    _nameController = TextEditingController(text: plan?.name ?? '');
    _startDate = plan?.startDate ?? DateTime.now();
    _endDate = plan?.endDate ?? DateTime.now().add(const Duration(days: 30));
    _targetCharacters = plan?.targetCharactersPerDay ?? 5;
    _targetStudyTime =
        plan?.targetStudyTimePerDay ?? const Duration(minutes: 30);
    if (plan != null) {
      _selectedCategories.addAll(plan.selectedCategories);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _learningPlanBloc,
      child: BlocListener<LearningPlanBloc, LearningPlanState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (plans) {
              if (!context.mounted) return;
              if (_isSaving) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      widget.initialPlan == null ? '创建成功' : '更新成功',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                context.go('/');
              }
            },
            error: (message) {
              if (!context.mounted) return;
              setState(() {
                _isSaving = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('错误：$message'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(widget.initialPlan == null ? '创建学习计划' : '编辑学习计划'),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/');
                },
              ),
              actions: [
                if (widget.initialPlan != null)
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: _showDeleteConfirmation,
                    tooltip: '删除计划',
                  ),
              ],
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: '计划名称',
                      hintText: '例如：HSK3级备考计划',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入计划名称';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildDateRangePicker(),
                  const SizedBox(height: 16),
                  _buildDailyGoalsSection(),
                  const SizedBox(height: 16),
                  _buildCategoriesSection(),
                  const SizedBox(height: 24),
                  BlocBuilder<LearningPlanBloc, LearningPlanState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        orElse: () => ElevatedButton(
                          onPressed: () => _savePlan(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('保存计划'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateRangePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('计划时间范围',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () => _selectDate(true),
                icon: const Icon(Icons.calendar_today),
                label: Text('开始: ${_formatDate(_startDate)}'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextButton.icon(
                onPressed: () => _selectDate(false),
                icon: const Icon(Icons.calendar_today),
                label: Text('结束: ${_formatDate(_endDate)}'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDailyGoalsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('每日目标',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _targetCharacters.toString(),
                    decoration: const InputDecoration(
                      labelText: '目标汉字数',
                      suffixText: '个',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _targetCharacters =
                          int.tryParse(value) ?? _targetCharacters;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: (_targetStudyTime.inMinutes).toString(),
                    decoration: const InputDecoration(
                      labelText: '学习时间',
                      suffixText: '分钟',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final minutes =
                          int.tryParse(value) ?? _targetStudyTime.inMinutes;
                      _targetStudyTime = Duration(minutes: minutes);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final categories = ['基础汉字', '常用词组', '商务用语', '学术用语', '日常会话'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('学习类别',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: categories.map((category) {
                final isSelected = _selectedCategories.contains(category);
                return FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedCategories.add(category);
                      } else {
                        _selectedCategories.remove(category);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(bool isStart) async {
    final initialDate = isStart ? _startDate : _endDate;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: isStart ? DateTime.now() : _startDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStart) {
          _startDate = pickedDate;
          if (_endDate.isBefore(_startDate)) {
            _endDate = _startDate.add(const Duration(days: 1));
          }
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _showDeleteConfirmation() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除学习计划"${widget.initialPlan?.name}"吗？\n此操作无法撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (result == true) {
      if (!context.mounted) return;
      context
          .read<LearningPlanBloc>()
          .add(LearningPlanEvent.deletePlan(widget.initialPlan!.id));
    }
  }

  void _savePlan(BuildContext context) {
    if (_isSaving) return;
    if (_formKey.currentState!.validate()) {
      if (_endDate.isBefore(_startDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('结束日期不能早于开始日期'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_targetCharacters <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('目标汉字数必须大于0'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_targetStudyTime.inMinutes <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('学习时间必须大于0分钟'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_selectedCategories.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('请至少选择一个学习类别'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() {
        _isSaving = true;
      });

      final plan = LearningPlan(
        id: widget.initialPlan?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        startDate: _startDate,
        endDate: _endDate,
        targetCharactersPerDay: _targetCharacters,
        targetStudyTimePerDay: _targetStudyTime,
        selectedCategories: _selectedCategories,
        exerciseTypeGoals: const {},
        isActive: true,
        dailyGoals: widget.initialPlan?.dailyGoals ?? [],
      );

      if (widget.initialPlan != null) {
        _learningPlanBloc.add(LearningPlanEvent.updatePlan(plan));
      } else {
        _learningPlanBloc.add(LearningPlanEvent.savePlan(plan));
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isSaving = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _learningPlanBloc.close();
    super.dispose();
  }
}
