-- Threat: !InfrastructureShared
-- Name: 71b357779c62
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

-- [unluac error] diagnostic pseudocode: recovery errors; output may not recompile or preserve behavior

-- [unluac error] HIR exit diagnostics: proto#0 requires unavailable goto/label
-- [unluac error] proto#0 failed during hir: HIR proto#0 has invalid structure region#16: loop syntax block owns a planned label
-- last completed stage: structure
-- structure proto#0 root=r0 regions=146 branches=23 loops=3 conditions=23 phis=10 labels=1 requirements=1
--   region r0 Sequence { parent: None, children: [RegionId(44), RegionId(1), RegionId(95)] }
--   region r1 Branch { parent: RegionId(0), plan: BranchPlanId(1), entry: BlockRef(4), condition: RegionId(2), then_arm: RegionId(3), else_arm: None, continuation: Some(BlockRef(6)) }
--   region r2 Sequence { parent: Some(RegionId(1)), children: [RegionId(93), RegionId(94)] }
--   region r3 Sequence { parent: Some(RegionId(1)), children: [RegionId(37), RegionId(78), RegionId(79), RegionId(4), RegionId(103)] }
--   region r4 Branch { parent: RegionId(3), plan: BranchPlanId(4), entry: BlockRef(18), condition: RegionId(5), then_arm: RegionId(6), else_arm: None, continuation: Some(BlockRef(20)) }
--   region r5 Sequence { parent: Some(RegionId(4)), children: [RegionId(101), RegionId(102)] }
--   region r6 Sequence { parent: Some(RegionId(4)), children: [RegionId(13), RegionId(43), RegionId(23), RegionId(7), RegionId(75), RegionId(145)] }
--   region r7 Branch { parent: RegionId(6), plan: BranchPlanId(15), entry: BlockRef(46), condition: RegionId(8), then_arm: RegionId(9), else_arm: None, continuation: Some(BlockRef(71)) }
--   region r8 Sequence { parent: Some(RegionId(7)), children: [RegionId(124)] }
--   region r9 Sequence { parent: Some(RegionId(7)), children: [RegionId(53), RegionId(80), RegionId(87), RegionId(88), RegionId(10)] }
--   region r10 Branch { parent: RegionId(9), plan: BranchPlanId(18), entry: BlockRef(58), condition: RegionId(11), then_arm: RegionId(12), else_arm: None, continuation: Some(BlockRef(71)) }
--   region r11 Sequence { parent: Some(RegionId(10)), children: [RegionId(129)] }
--   region r12 Sequence { parent: Some(RegionId(10)), children: [RegionId(66), RegionId(69), RegionId(33), RegionId(141)] }
--   region r13 Branch { parent: RegionId(6), plan: BranchPlanId(5), entry: BlockRef(21), condition: RegionId(14), then_arm: RegionId(15), else_arm: None, continuation: Some(BlockRef(33)) }
--   region r14 Sequence { parent: Some(RegionId(13)), children: [RegionId(104)] }
--   region r15 Sequence { parent: Some(RegionId(13)), children: [RegionId(16)] }
--   region r16 Loop { parent: RegionId(15), plan: LoopPlanId(0), entry: BlockRef(22), preheader: Some(RegionId(17)), control: RegionId(18), body: RegionId(19), normal_tail: None }
--   region r17 Sequence { parent: Some(RegionId(16)), children: [RegionId(105)] }
--   region r18 Sequence { parent: Some(RegionId(16)), children: [RegionId(115)] }
--   region r19 Sequence { parent: Some(RegionId(16)), children: [RegionId(20)] }
--   region r20 Branch { parent: RegionId(19), plan: BranchPlanId(6), entry: BlockRef(23), condition: RegionId(21), then_arm: RegionId(22), else_arm: None, continuation: Some(BlockRef(32)) }
--   region r21 Sequence { parent: Some(RegionId(20)), children: [RegionId(106), RegionId(107)] }
--   region r22 Sequence { parent: Some(RegionId(20)), children: [RegionId(30)] }
--   region r23 Branch { parent: RegionId(6), plan: BranchPlanId(11), entry: BlockRef(38), condition: RegionId(24), then_arm: RegionId(25), else_arm: None, continuation: Some(BlockRef(46)) }
--   region r24 Sequence { parent: Some(RegionId(23)), children: [RegionId(116)] }
--   region r25 Sequence { parent: Some(RegionId(23)), children: [RegionId(26)] }
--   region r26 Loop { parent: RegionId(25), plan: LoopPlanId(1), entry: BlockRef(39), preheader: Some(RegionId(27)), control: RegionId(28), body: RegionId(29), normal_tail: None }
--   region r27 Sequence { parent: Some(RegionId(26)), children: [RegionId(117)] }
--   region r28 Sequence { parent: Some(RegionId(26)), children: [RegionId(123)] }
--   region r29 Sequence { parent: Some(RegionId(26)), children: [RegionId(40)] }
--   region r30 Branch { parent: RegionId(22), plan: BranchPlanId(7), entry: BlockRef(25), condition: RegionId(31), then_arm: RegionId(32), else_arm: None, continuation: Some(BlockRef(32)) }
--   region r31 Sequence { parent: Some(RegionId(30)), children: [RegionId(108), RegionId(109)] }
--   region r32 Sequence { parent: Some(RegionId(30)), children: [RegionId(110), RegionId(47)] }
--   region r33 Loop { parent: RegionId(12), plan: LoopPlanId(2), entry: BlockRef(65), preheader: Some(RegionId(34)), control: RegionId(35), body: RegionId(36), normal_tail: None }
--   region r34 Sequence { parent: Some(RegionId(33)), children: [RegionId(136)] }
--   region r35 Sequence { parent: Some(RegionId(33)), children: [RegionId(140)] }
--   region r36 Sequence { parent: Some(RegionId(33)), children: [RegionId(72)] }
--   region r37 Branch { parent: RegionId(3), plan: BranchPlanId(2), entry: BlockRef(7), condition: RegionId(38), then_arm: RegionId(39), else_arm: None, continuation: Some(BlockRef(12)) }
--   region r38 Sequence { parent: Some(RegionId(37)), children: [RegionId(96), RegionId(97)] }
--   region r39 Sequence { parent: Some(RegionId(37)), children: [RegionId(57)] }
--   region r40 Branch { parent: RegionId(29), plan: BranchPlanId(12), entry: BlockRef(40), condition: RegionId(41), then_arm: RegionId(42), else_arm: None, continuation: Some(BlockRef(45)) }
--   region r41 Sequence { parent: Some(RegionId(40)), children: [RegionId(118)] }
--   region r42 Sequence { parent: Some(RegionId(40)), children: [RegionId(50)] }
--   region r43 ValueDecision { parent: RegionId(6), plan: ValueDecisionPlanId(2), entry: BlockRef(33), continuation: BlockRef(38) }
--   region r44 Branch { parent: RegionId(0), plan: BranchPlanId(0), entry: BlockRef(0), condition: RegionId(45), then_arm: RegionId(46), else_arm: None, continuation: Some(BlockRef(4)) }
--   region r45 Sequence { parent: Some(RegionId(44)), children: [RegionId(89), RegionId(90), RegionId(91)] }
--   region r46 Sequence { parent: Some(RegionId(44)), children: [RegionId(92)] }
--   region r47 Branch { parent: RegionId(32), plan: BranchPlanId(8), entry: BlockRef(28), condition: RegionId(48), then_arm: RegionId(49), else_arm: None, continuation: Some(BlockRef(32)) }
--   region r48 Sequence { parent: Some(RegionId(47)), children: [RegionId(111)] }
--   region r49 Sequence { parent: Some(RegionId(47)), children: [RegionId(60)] }
--   region r50 Branch { parent: RegionId(42), plan: BranchPlanId(13), entry: BlockRef(41), condition: RegionId(51), then_arm: RegionId(52), else_arm: None, continuation: Some(BlockRef(45)) }
--   region r51 Sequence { parent: Some(RegionId(50)), children: [RegionId(119)] }
--   region r52 Sequence { parent: Some(RegionId(50)), children: [RegionId(63)] }
--   region r53 Branch { parent: RegionId(9), plan: BranchPlanId(16), entry: BlockRef(47), condition: RegionId(54), then_arm: RegionId(55), else_arm: Some(RegionId(56)), continuation: Some(BlockRef(51)) }
--   region r54 Sequence { parent: Some(RegionId(53)), children: [RegionId(125)] }
--   region r55 Sequence { parent: Some(RegionId(53)), children: [RegionId(84)] }
--   region r56 Sequence { parent: Some(RegionId(53)), children: [RegionId(126)] }
--   region r57 Branch { parent: RegionId(39), plan: BranchPlanId(3), entry: BlockRef(9), condition: RegionId(58), then_arm: RegionId(59), else_arm: None, continuation: Some(BlockRef(12)) }
--   region r58 Sequence { parent: Some(RegionId(57)), children: [RegionId(98), RegionId(99)] }
--   region r59 Sequence { parent: Some(RegionId(57)), children: [RegionId(100)] }
--   region r60 Branch { parent: RegionId(49), plan: BranchPlanId(9), entry: BlockRef(29), condition: RegionId(61), then_arm: RegionId(62), else_arm: None, continuation: Some(BlockRef(32)) }
--   region r61 Sequence { parent: Some(RegionId(60)), children: [RegionId(112)] }
--   region r62 Sequence { parent: Some(RegionId(60)), children: [RegionId(81)] }
--   region r63 Branch { parent: RegionId(52), plan: BranchPlanId(14), entry: BlockRef(42), condition: RegionId(64), then_arm: RegionId(65), else_arm: None, continuation: Some(BlockRef(45)) }
--   region r64 Sequence { parent: Some(RegionId(63)), children: [RegionId(120), RegionId(121)] }
--   region r65 Sequence { parent: Some(RegionId(63)), children: [RegionId(122)] }
--   region r66 Branch { parent: RegionId(12), plan: BranchPlanId(19), entry: BlockRef(59), condition: RegionId(67), then_arm: RegionId(68), else_arm: None, continuation: Some(BlockRef(62)) }
--   region r67 Sequence { parent: Some(RegionId(66)), children: [RegionId(130), RegionId(131)] }
--   region r68 Sequence { parent: Some(RegionId(66)), children: [RegionId(132)] }
--   region r69 Branch { parent: RegionId(12), plan: BranchPlanId(20), entry: BlockRef(62), condition: RegionId(70), then_arm: RegionId(71), else_arm: None, continuation: Some(BlockRef(65)) }
--   region r70 Sequence { parent: Some(RegionId(69)), children: [RegionId(133), RegionId(134)] }
--   region r71 Sequence { parent: Some(RegionId(69)), children: [RegionId(135)] }
--   region r72 Branch { parent: RegionId(36), plan: BranchPlanId(21), entry: BlockRef(66), condition: RegionId(73), then_arm: RegionId(74), else_arm: None, continuation: Some(BlockRef(69)) }
--   region r73 Sequence { parent: Some(RegionId(72)), children: [RegionId(137), RegionId(138)] }
--   region r74 Sequence { parent: Some(RegionId(72)), children: [RegionId(139)] }
--   region r75 Branch { parent: RegionId(6), plan: BranchPlanId(22), entry: BlockRef(71), condition: RegionId(76), then_arm: RegionId(77), else_arm: None, continuation: Some(BlockRef(74)) }
--   region r76 Sequence { parent: Some(RegionId(75)), children: [RegionId(142), RegionId(143)] }
--   region r77 Sequence { parent: Some(RegionId(75)), children: [RegionId(144)] }
--   region r78 ValueDecision { parent: RegionId(3), plan: ValueDecisionPlanId(0), entry: BlockRef(12), continuation: BlockRef(15) }
--   region r79 ValueDecision { parent: RegionId(3), plan: ValueDecisionPlanId(1), entry: BlockRef(15), continuation: BlockRef(18) }
--   region r80 ValueDecision { parent: RegionId(9), plan: ValueDecisionPlanId(3), entry: BlockRef(51), continuation: BlockRef(54) }
--   region r81 Branch { parent: RegionId(62), plan: BranchPlanId(10), entry: BlockRef(30), condition: RegionId(82), then_arm: RegionId(83), else_arm: None, continuation: Some(BlockRef(32)) }
--   region r82 Sequence { parent: Some(RegionId(81)), children: [RegionId(113)] }
--   region r83 Sequence { parent: Some(RegionId(81)), children: [RegionId(114)] }
--   region r84 Branch { parent: RegionId(55), plan: BranchPlanId(17), entry: BlockRef(49), condition: RegionId(85), then_arm: RegionId(86), else_arm: None, continuation: Some(BlockRef(51)) }
--   region r85 Sequence { parent: Some(RegionId(84)), children: [RegionId(127)] }
--   region r86 Sequence { parent: Some(RegionId(84)), children: [RegionId(128)] }
--   region r87 ValueDecision { parent: RegionId(9), plan: ValueDecisionPlanId(4), entry: BlockRef(54), continuation: BlockRef(56) }
--   region r88 ValueDecision { parent: RegionId(9), plan: ValueDecisionPlanId(5), entry: BlockRef(56), continuation: BlockRef(58) }
--   region r89 Block { parent: RegionId(45), block: BlockRef(0) }
--   region r90 Block { parent: RegionId(45), block: BlockRef(1) }
--   region r91 Block { parent: RegionId(45), block: BlockRef(2) }
--   region r92 Block { parent: RegionId(46), block: BlockRef(3) }
--   region r93 Block { parent: RegionId(2), block: BlockRef(4) }
--   region r94 Block { parent: RegionId(2), block: BlockRef(5) }
--   region r95 Block { parent: RegionId(0), block: BlockRef(6) }
--   region r96 Block { parent: RegionId(38), block: BlockRef(7) }
--   region r97 Block { parent: RegionId(38), block: BlockRef(8) }
--   region r98 Block { parent: RegionId(58), block: BlockRef(9) }
--   region r99 Block { parent: RegionId(58), block: BlockRef(10) }
--   region r100 Block { parent: RegionId(59), block: BlockRef(11) }
--   region r101 Block { parent: RegionId(5), block: BlockRef(18) }
--   region r102 Block { parent: RegionId(5), block: BlockRef(19) }
--   region r103 Block { parent: RegionId(3), block: BlockRef(20) }
--   region r104 Block { parent: RegionId(14), block: BlockRef(21) }
--   region r105 Block { parent: RegionId(17), block: BlockRef(22) }
--   region r106 Block { parent: RegionId(21), block: BlockRef(23) }
--   region r107 Block { parent: RegionId(21), block: BlockRef(24) }
--   region r108 Block { parent: RegionId(31), block: BlockRef(25) }
--   region r109 Block { parent: RegionId(31), block: BlockRef(26) }
--   region r110 Block { parent: RegionId(32), block: BlockRef(27) }
--   region r111 Block { parent: RegionId(48), block: BlockRef(28) }
--   region r112 Block { parent: RegionId(61), block: BlockRef(29) }
--   region r113 Block { parent: RegionId(82), block: BlockRef(30) }
--   region r114 Block { parent: RegionId(83), block: BlockRef(31) }
--   region r115 Block { parent: RegionId(18), block: BlockRef(32) }
--   region r116 Block { parent: RegionId(24), block: BlockRef(38) }
--   region r117 Block { parent: RegionId(27), block: BlockRef(39) }
--   region r118 Block { parent: RegionId(41), block: BlockRef(40) }
--   region r119 Block { parent: RegionId(51), block: BlockRef(41) }
--   region r120 Block { parent: RegionId(64), block: BlockRef(42) }
--   region r121 Block { parent: RegionId(64), block: BlockRef(43) }
--   region r122 Block { parent: RegionId(65), block: BlockRef(44) }
--   region r123 Block { parent: RegionId(28), block: BlockRef(45) }
--   region r124 Block { parent: RegionId(8), block: BlockRef(46) }
--   region r125 Block { parent: RegionId(54), block: BlockRef(47) }
--   region r126 Block { parent: RegionId(56), block: BlockRef(48) }
--   region r127 Block { parent: RegionId(85), block: BlockRef(49) }
--   region r128 Block { parent: RegionId(86), block: BlockRef(50) }
--   region r129 Block { parent: RegionId(11), block: BlockRef(58) }
--   region r130 Block { parent: RegionId(67), block: BlockRef(59) }
--   region r131 Block { parent: RegionId(67), block: BlockRef(60) }
--   region r132 Block { parent: RegionId(68), block: BlockRef(61) }
--   region r133 Block { parent: RegionId(70), block: BlockRef(62) }
--   region r134 Block { parent: RegionId(70), block: BlockRef(63) }
--   region r135 Block { parent: RegionId(71), block: BlockRef(64) }
--   region r136 Block { parent: RegionId(34), block: BlockRef(65) }
--   region r137 Block { parent: RegionId(73), block: BlockRef(66) }
--   region r138 Block { parent: RegionId(73), block: BlockRef(67) }
--   region r139 Block { parent: RegionId(74), block: BlockRef(68) }
--   region r140 Block { parent: RegionId(35), block: BlockRef(69) }
--   region r141 Block { parent: RegionId(12), block: BlockRef(70) }
--   region r142 Block { parent: RegionId(76), block: BlockRef(71) }
--   region r143 Block { parent: RegionId(76), block: BlockRef(72) }
--   region r144 Block { parent: RegionId(77), block: BlockRef(73) }
--   region r145 Block { parent: RegionId(6), block: BlockRef(74) }
--   branch b0 BranchPlanData { header: BlockRef(0), kind: IfThen, condition: ConditionPlanId(0), condition_inverted: false, then_edge: EdgeRef(5), else_edge: EdgeRef(0), continuation: Some(BlockRef(4)), value_plan: None }
--   branch b1 BranchPlanData { header: BlockRef(4), kind: IfThen, condition: ConditionPlanId(1), condition_inverted: true, then_edge: EdgeRef(9), else_edge: EdgeRef(7), continuation: Some(BlockRef(6)), value_plan: None }
--   branch b2 BranchPlanData { header: BlockRef(7), kind: Guard, condition: ConditionPlanId(2), condition_inverted: false, then_edge: EdgeRef(15), else_edge: EdgeRef(12), continuation: Some(BlockRef(12)), value_plan: None }
--   branch b3 BranchPlanData { header: BlockRef(9), kind: Guard, condition: ConditionPlanId(3), condition_inverted: true, then_edge: EdgeRef(19), else_edge: EdgeRef(16), continuation: Some(BlockRef(12)), value_plan: None }
--   branch b4 BranchPlanData { header: BlockRef(18), kind: IfThen, condition: ConditionPlanId(4), condition_inverted: true, then_edge: EdgeRef(33), else_edge: EdgeRef(31), continuation: Some(BlockRef(20)), value_plan: None }
--   branch b5 BranchPlanData { header: BlockRef(21), kind: IfThen, condition: ConditionPlanId(5), condition_inverted: false, then_edge: EdgeRef(37), else_edge: EdgeRef(36), continuation: Some(BlockRef(33)), value_plan: None }
--   branch b6 BranchPlanData { header: BlockRef(23), kind: Guard, condition: ConditionPlanId(6), condition_inverted: false, then_edge: EdgeRef(42), else_edge: EdgeRef(39), continuation: Some(BlockRef(32)), value_plan: None }
--   branch b7 BranchPlanData { header: BlockRef(25), kind: Guard, condition: ConditionPlanId(7), condition_inverted: false, then_edge: EdgeRef(43), else_edge: EdgeRef(45), continuation: Some(BlockRef(32)), value_plan: None }
--   branch b8 BranchPlanData { header: BlockRef(28), kind: IfThen, condition: ConditionPlanId(8), condition_inverted: false, then_edge: EdgeRef(50), else_edge: EdgeRef(49), continuation: Some(BlockRef(32)), value_plan: None }
--   branch b9 BranchPlanData { header: BlockRef(29), kind: IfThen, condition: ConditionPlanId(9), condition_inverted: false, then_edge: EdgeRef(52), else_edge: EdgeRef(51), continuation: Some(BlockRef(32)), value_plan: None }
--   branch b10 BranchPlanData { header: BlockRef(30), kind: IfThen, condition: ConditionPlanId(10), condition_inverted: false, then_edge: EdgeRef(54), else_edge: EdgeRef(53), continuation: Some(BlockRef(32)), value_plan: None }
--   branch b11 BranchPlanData { header: BlockRef(38), kind: IfThen, condition: ConditionPlanId(11), condition_inverted: false, then_edge: EdgeRef(66), else_edge: EdgeRef(65), continuation: Some(BlockRef(46)), value_plan: Some(BranchValuePlan { merge: BlockRef(46), values: [BranchValueMergeValue { phi_id: PhiId(5), reg: Reg(11), then_arm: BranchValueMergeArm { preds: {BlockRef(44), BlockRef(45)}, values: {Def(DefId(125)), Def(DefId(155))}, entry_values: {Def(DefId(125))}, update_values: {Def(DefId(155))} }, else_arm: BranchValueMergeArm { preds: {BlockRef(38)}, values: {Def(DefId(125))}, entry_values: {Def(DefId(125))}, update_values: {} } }] }) }
--   branch b12 BranchPlanData { header: BlockRef(40), kind: IfThen, condition: ConditionPlanId(12), condition_inverted: false, then_edge: EdgeRef(69), else_edge: EdgeRef(68), continuation: Some(BlockRef(45)), value_plan: None }
--   branch b13 BranchPlanData { header: BlockRef(41), kind: IfThen, condition: ConditionPlanId(13), condition_inverted: false, then_edge: EdgeRef(71), else_edge: EdgeRef(70), continuation: Some(BlockRef(45)), value_plan: None }
--   branch b14 BranchPlanData { header: BlockRef(42), kind: Guard, condition: ConditionPlanId(14), condition_inverted: true, then_edge: EdgeRef(72), else_edge: EdgeRef(74), continuation: Some(BlockRef(45)), value_plan: None }
--   branch b15 BranchPlanData { header: BlockRef(46), kind: IfThen, condition: ConditionPlanId(15), condition_inverted: false, then_edge: EdgeRef(80), else_edge: EdgeRef(79), continuation: Some(BlockRef(71)), value_plan: None }
--   branch b16 BranchPlanData { header: BlockRef(47), kind: IfElse, condition: ConditionPlanId(16), condition_inverted: false, then_edge: EdgeRef(81), else_edge: EdgeRef(82), continuation: Some(BlockRef(51)), value_plan: None }
--   branch b17 BranchPlanData { header: BlockRef(49), kind: IfThen, condition: ConditionPlanId(17), condition_inverted: false, then_edge: EdgeRef(85), else_edge: EdgeRef(84), continuation: Some(BlockRef(51)), value_plan: None }
--   branch b18 BranchPlanData { header: BlockRef(58), kind: IfThen, condition: ConditionPlanId(18), condition_inverted: false, then_edge: EdgeRef(99), else_edge: EdgeRef(98), continuation: Some(BlockRef(71)), value_plan: None }
--   branch b19 BranchPlanData { header: BlockRef(59), kind: Guard, condition: ConditionPlanId(19), condition_inverted: false, then_edge: EdgeRef(103), else_edge: EdgeRef(100), continuation: Some(BlockRef(62)), value_plan: None }
--   branch b20 BranchPlanData { header: BlockRef(62), kind: Guard, condition: ConditionPlanId(20), condition_inverted: false, then_edge: EdgeRef(108), else_edge: EdgeRef(105), continuation: Some(BlockRef(65)), value_plan: None }
--   branch b21 BranchPlanData { header: BlockRef(66), kind: Guard, condition: ConditionPlanId(21), condition_inverted: false, then_edge: EdgeRef(114), else_edge: EdgeRef(111), continuation: Some(BlockRef(69)), value_plan: None }
--   branch b22 BranchPlanData { header: BlockRef(71), kind: Guard, condition: ConditionPlanId(22), condition_inverted: false, then_edge: EdgeRef(122), else_edge: EdgeRef(119), continuation: Some(BlockRef(74)), value_plan: None }
--   loop l0 LoopPlanData { kind: GenericForLike, header: BlockRef(32), preheader_block: Some(BlockRef(22)), condition_header: None, condition: None, condition_prefix_placement: None, continuation: Some(BlockRef(33)), continue_target: Some(BlockRef(32)), source_bindings: Some(Generic(RegRange { start: Reg(12), len: 2 })), control_edges: LoopControlEdges { preheader_body: Some(EdgeRef(38)), preheader_exit: None, body: [EdgeRef(56)], exit: [EdgeRef(57)], backedges: [EdgeRef(39), EdgeRef(41), EdgeRef(45), EdgeRef(47), EdgeRef(49), EdgeRef(51), EdgeRef(53), EdgeRef(55)], continues: [] }, break_edges: [], normalized_exit_aliases: [], normal_tail: None, exit_tail: None, propagated_break: None, header_values: [LoopValueMerge { phi_id: PhiId(2), reg: Reg(11), inside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(1), PhiIncomingSlot(2), PhiIncomingSlot(3), PhiIncomingSlot(4), PhiIncomingSlot(5), PhiIncomingSlot(6), PhiIncomingSlot(7), PhiIncomingSlot(8)] }, outside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(0)] } }], exit_values: [], protocol: Some(GenericFor(GenericForProtocol { prep_instr: None, call_instr: InstrRef(142), loop_instr: InstrRef(143), body_edge: EdgeRef(56), exit_edge: EdgeRef(57), body_completes_normally: true, iterator: RegRange { start: Reg(9), len: 3 }, bindings: RegRange { start: Reg(12), len: 2 }, immediate_break: false })), value_actions: Some(LoopValueActions { batches: [], elided: [EdgeCopyOrigin { edge: EdgeRef(38), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(39), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(41), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(45), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(47), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(49), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(51), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(53), target: PhiId(2) }, EdgeCopyOrigin { edge: EdgeRef(55), target: PhiId(2) }] }) }
--   loop l1 LoopPlanData { kind: GenericForLike, header: BlockRef(45), preheader_block: Some(BlockRef(39)), condition_header: None, condition: None, condition_prefix_placement: None, continuation: Some(BlockRef(46)), continue_target: Some(BlockRef(45)), source_bindings: Some(Generic(RegRange { start: Reg(17), len: 2 })), control_edges: LoopControlEdges { preheader_body: Some(EdgeRef(67)), preheader_exit: None, body: [EdgeRef(77)], exit: [EdgeRef(78)], backedges: [EdgeRef(68), EdgeRef(70), EdgeRef(74)], continues: [] }, break_edges: [EdgeRef(76)], normalized_exit_aliases: [], normal_tail: None, exit_tail: None, propagated_break: None, header_values: [LoopValueMerge { phi_id: PhiId(4), reg: Reg(16), inside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(1), PhiIncomingSlot(2), PhiIncomingSlot(3)] }, outside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(0)] } }], exit_values: [LoopExitValueMergeCandidate { exit: BlockRef(46), values: [LoopValueMerge { phi_id: PhiId(5), reg: Reg(11), inside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(1), PhiIncomingSlot(2)] }, outside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(0)] } }] }], protocol: Some(GenericFor(GenericForProtocol { prep_instr: None, call_instr: InstrRef(196), loop_instr: InstrRef(197), body_edge: EdgeRef(77), exit_edge: EdgeRef(78), body_completes_normally: true, iterator: RegRange { start: Reg(14), len: 3 }, bindings: RegRange { start: Reg(17), len: 2 }, immediate_break: false })), value_actions: Some(LoopValueActions { batches: [LoopValueActionBatch { phase: BeforeLoop, writes: [LoopValueWrite { target: PhiId(5), source: Ssa(Def(DefId(125))), origins: [EdgeCopyOrigin { edge: EdgeRef(78), target: PhiId(5) }] }] }], elided: [EdgeCopyOrigin { edge: EdgeRef(67), target: PhiId(4) }, EdgeCopyOrigin { edge: EdgeRef(68), target: PhiId(4) }, EdgeCopyOrigin { edge: EdgeRef(70), target: PhiId(4) }, EdgeCopyOrigin { edge: EdgeRef(74), target: PhiId(4) }] }) }
--   loop l2 LoopPlanData { kind: GenericForLike, header: BlockRef(69), preheader_block: Some(BlockRef(65)), condition_header: None, condition: None, condition_prefix_placement: None, continuation: Some(BlockRef(70)), continue_target: Some(BlockRef(69)), source_bindings: Some(Generic(RegRange { start: Reg(29), len: 2 })), control_edges: LoopControlEdges { preheader_body: Some(EdgeRef(110)), preheader_exit: None, body: [EdgeRef(116)], exit: [EdgeRef(117)], backedges: [EdgeRef(111), EdgeRef(113), EdgeRef(115)], continues: [] }, break_edges: [], normalized_exit_aliases: [], normal_tail: None, exit_tail: None, propagated_break: None, header_values: [LoopValueMerge { phi_id: PhiId(9), reg: Reg(28), inside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(1), PhiIncomingSlot(2), PhiIncomingSlot(3)] }, outside_arm: LoopValueArm { incoming_slots: [PhiIncomingSlot(0)] } }], exit_values: [], protocol: Some(GenericFor(GenericForProtocol { prep_instr: None, call_instr: InstrRef(324), loop_instr: InstrRef(325), body_edge: EdgeRef(116), exit_edge: EdgeRef(117), body_completes_normally: true, iterator: RegRange { start: Reg(26), len: 3 }, bindings: RegRange { start: Reg(29), len: 2 }, immediate_break: false })), value_actions: Some(LoopValueActions { batches: [], elided: [EdgeCopyOrigin { edge: EdgeRef(110), target: PhiId(9) }, EdgeCopyOrigin { edge: EdgeRef(111), target: PhiId(9) }, EdgeCopyOrigin { edge: EdgeRef(113), target: PhiId(9) }, EdgeCopyOrigin { edge: EdgeRef(115), target: PhiId(9) }] }) }
--   phi PhiPlan { phi: PhiId(0), block: BlockRef(15), reg: Reg(2), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(21)), value: Def(DefId(26)), disposition: RegionResult(RegionId(78)) }, PhiIncomingPlan { edge: Some(EdgeRef(23)), value: Def(DefId(26)), disposition: RegionResult(RegionId(78)) }, PhiIncomingPlan { edge: Some(EdgeRef(25)), value: Def(DefId(35)), disposition: RegionResult(RegionId(78)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(1), block: BlockRef(18), reg: Reg(2), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(26)), value: Phi(PhiId(0)), disposition: RegionResult(RegionId(79)) }, PhiIncomingPlan { edge: Some(EdgeRef(28)), value: Phi(PhiId(0)), disposition: RegionResult(RegionId(79)) }, PhiIncomingPlan { edge: Some(EdgeRef(30)), value: Def(DefId(44)), disposition: RegionResult(RegionId(79)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(2), block: BlockRef(32), reg: Reg(11), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(38)), value: Def(DefId(68)), disposition: RegionInput(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(39)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(41)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(45)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(47)), value: Def(DefId(112)), disposition: EdgeCopy }, PhiIncomingPlan { edge: Some(EdgeRef(49)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(51)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(53)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }, PhiIncomingPlan { edge: Some(EdgeRef(55)), value: Def(DefId(112)), disposition: LoopCarried(RegionId(16)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(3), block: BlockRef(38), reg: Reg(13), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(60)), value: Def(DefId(120)), disposition: RegionResult(RegionId(43)) }, PhiIncomingPlan { edge: Some(EdgeRef(63)), value: Def(DefId(121)), disposition: RegionResult(RegionId(43)) }, PhiIncomingPlan { edge: Some(EdgeRef(64)), value: Def(DefId(122)), disposition: RegionResult(RegionId(43)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(4), block: BlockRef(45), reg: Reg(16), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(67)), value: Def(DefId(134)), disposition: RegionInput(RegionId(26)) }, PhiIncomingPlan { edge: Some(EdgeRef(68)), value: Def(DefId(158)), disposition: LoopCarried(RegionId(26)) }, PhiIncomingPlan { edge: Some(EdgeRef(70)), value: Def(DefId(158)), disposition: LoopCarried(RegionId(26)) }, PhiIncomingPlan { edge: Some(EdgeRef(74)), value: Def(DefId(158)), disposition: LoopCarried(RegionId(26)) }], loop_carried: Some(LoopCarriedPhi { owner: RegionId(26), input: Some(Def(DefId(134))) }) }
--   phi PhiPlan { phi: PhiId(5), block: BlockRef(46), reg: Reg(11), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(65)), value: Def(DefId(125)), disposition: RegionResult(RegionId(23)) }, PhiIncomingPlan { edge: Some(EdgeRef(76)), value: Def(DefId(155)), disposition: RegionResult(RegionId(26)) }, PhiIncomingPlan { edge: Some(EdgeRef(78)), value: Def(DefId(125)), disposition: RegionResult(RegionId(26)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(6), block: BlockRef(54), reg: Reg(16), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(87)), value: Def(DefId(177)), disposition: RegionResult(RegionId(80)) }, PhiIncomingPlan { edge: Some(EdgeRef(89)), value: Def(DefId(177)), disposition: RegionResult(RegionId(80)) }, PhiIncomingPlan { edge: Some(EdgeRef(91)), value: Def(DefId(187)), disposition: RegionResult(RegionId(80)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(7), block: BlockRef(56), reg: Reg(16), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(92)), value: Phi(PhiId(6)), disposition: RegionResult(RegionId(87)) }, PhiIncomingPlan { edge: Some(EdgeRef(94)), value: Def(DefId(188)), disposition: RegionResult(RegionId(87)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(8), block: BlockRef(58), reg: Reg(18), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(95)), value: Def(DefId(191)), disposition: RegionResult(RegionId(88)) }, PhiIncomingPlan { edge: Some(EdgeRef(97)), value: Def(DefId(192)), disposition: RegionResult(RegionId(88)) }], loop_carried: None }
--   phi PhiPlan { phi: PhiId(9), block: BlockRef(69), reg: Reg(28), incomings: [PhiIncomingPlan { edge: Some(EdgeRef(110)), value: Def(DefId(231)), disposition: RegionInput(RegionId(33)) }, PhiIncomingPlan { edge: Some(EdgeRef(111)), value: Def(DefId(255)), disposition: LoopCarried(RegionId(33)) }, PhiIncomingPlan { edge: Some(EdgeRef(113)), value: Def(DefId(255)), disposition: LoopCarried(RegionId(33)) }, PhiIncomingPlan { edge: Some(EdgeRef(115)), value: Def(DefId(255)), disposition: LoopCarried(RegionId(33)) }], loop_carried: Some(LoopCarriedPhi { owner: RegionId(33), input: Some(Def(DefId(231))) }) }
--   requirement q0 Goto { edge: EdgeRef(47), label: LabelPlanId(0), reason: UnstructuredContinueLike }
-- [unluac error] proto#0 failed before child closure placement and captures were recovered; direct child protos follow as detached diagnostic functions

local function unluac_proto_1(p1_0)
  local r1_0 = ""
  if p1_0 then
    for r1_1 in p1_0:gmatch("%S+") do
      if r1_1:sub(1, 1) ~= "-" then
        r1_0 = r1_0 .. "|" .. r1_1
      end
    end
    return r1_0
  end
  return r1_0
end

local function unluac_proto_2(p2_0)
  if type(p2_0) == "string" and p2_0 ~= "" then
    local r2_0, r2_1 = MpCommon.StringRegExpSearch('npm(?:\\.cmd|\\.exe|-cli\\.js)?[\\\\\\"\\s]+(?:install|i|update)\\s+(.*)',
      p2_0)
    if r2_1 then
      local r2_2 = u2_0(r2_1)
      if r2_2 ~= "" then
        return { name = r2_2, version = nil }
      end
    end
    local r2_3 = p2_0:gsub("[\\/]+", "/")
    p2_0 = r2_3
    r2_3 = p2_0.match
    r2_3 = r2_3(p2_0, "%-%-module_name%s*=%s*([%w%._%-@/]+)")
    if r2_3 then
      return { name = r2_3, version = nil }
    end
    local r2_4 = p2_0:match("/%.pnpm/([^/]+)/node_modules/")
    if r2_4 then
      local r2_5, r2_6, r2_7 = r2_4:match("^@([^+]+)%+([^@]+)@(.+)$")
      if r2_5 then
        local r2_8 = {}
        local r2_9 = "@"
        local r2_10 = r2_5
        local r2_11 = r2_6
        r2_9 = r2_9 .. r2_10 .. "/" .. r2_11
        r2_8.name = r2_9
        r2_8.version = r2_7
        return r2_8
      end
      local r2_12, r2_13 = r2_4:match("^([^@]+)@(.+)$")
      if r2_12 then
        return { name = r2_12, version = r2_13 }
      end
    end
    local r2_14, r2_15 = p2_0:match("node[_]?modules[/ ]+@([^/ ]+)[/ ]+([^/ ]+)")
    if r2_14 then
      local r2_16 = {}
      local r2_17 = "@"
      local r2_18 = r2_14
      local r2_19 = r2_15
      r2_17 = r2_17 .. r2_18 .. "/" .. r2_19
      r2_16.name = r2_17
      r2_16.version = nil
      return r2_16
    end
    local r2_20 = p2_0:match("node[_]?modules[/ ]+([^/ ]+)")
    if r2_20 and r2_20 ~= ".bin" then
      return { name = r2_20, version = nil }
    end
    return { name = nil, version = nil }
  end
  return { name = nil, version = nil }
end
