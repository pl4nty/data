-- Threat: !InfrastructureShared
-- Name: ddbb31b2872e9
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  return p1_0 ~= nil and p1_0.matched
end

local function r0_1(...)
  local r2_1, r2_2 = 0, 1
  while r2_2 <= select("#", ...) do
    if select(r2_2, ...) then
      r2_1 = r2_1 + 1
    end
    r2_2 = r2_2 + 1
  end
  return r2_1
end

local function r0_2(p3_0, p3_1)
  if p3_1 ~= nil and tostring(p3_1) ~= "" then
    bm.add_related_string(p3_0, tostring(p3_1), bm.RelatedStringBMReport)
  end
end

local function r0_3(p4_0, p4_1)
  if r0_0(p4_0) then
    r0_2(p4_1 .. "Param1", p4_0.utf8p1)
    r0_2(p4_1 .. "Param2", p4_0.utf8p2)
  end
end

local function r0_4(p5_0)
  r0_3(p5_0, "PackageName")
  r0_3(p5_0, "PackageStaticConfigArtifact")
end

local function r0_5(p6_0)
  if p6_0 == nil then
    return nil
  end
  if p6_0.image_path ~= nil and p6_0.image_path ~= "" then
    return p6_0.image_path
  end
  if p6_0.parent_image_path ~= nil and p6_0.parent_image_path ~= "" then
    return p6_0.parent_image_path
  end
  if p6_0.process_path ~= nil and p6_0.process_path ~= "" then
    return p6_0.process_path
  end
  if p6_0.utf8p1 ~= nil and p6_0.utf8p1 ~= "" then
    return p6_0.utf8p1
  end
  if p6_0.utf8p2 == nil or p6_0.utf8p2 == "" then
    return nil
  end
  return p6_0.utf8p2
end

local function r0_6(p7_0)
  if p7_0 == nil then
    return nil
  end
  if p7_0.command_line ~= nil and p7_0.command_line ~= "" then
    return p7_0.command_line
  end
  if p7_0.cmd_line ~= nil and p7_0.cmd_line ~= "" then
    return p7_0.cmd_line
  end
  if p7_0.process_command_line ~= nil and p7_0.process_command_line ~= "" then
    return p7_0.process_command_line
  end
  if p7_0.parent_command_line ~= nil and p7_0.parent_command_line ~= "" then
    return p7_0.parent_command_line
  end
  if p7_0.utf8p2 == nil or p7_0.utf8p2 == "" then
    return nil
  end
  return p7_0.utf8p2
end

local function r0_7(p8_0, p8_1)
  if p8_1 ~= nil and tostring(p8_1) ~= "" and #p8_0 < 5 then
    p8_0[#p8_0 + 1] = tostring(p8_1)
  end
end

local function r0_8(p9_0, p9_1)
  if p9_1 ~= nil and tostring(p9_1) ~= "" and #p9_0 < 5 then
    p9_0[#p9_0 + 1] = tostring(p9_1)
  end
end

local function r0_9(p10_0, p10_1, p10_2)
  if p10_1 == nil then
    return
  end
  if p10_2 then
    local r10_0 = #p10_1
    while r10_0 >= 1 and #p10_0 < 5 do
      r0_7(p10_0, r0_5(p10_1[r10_0]))
      r10_0 = r10_0 - 1
    end
  else
    local r10_1 = 1
    while #p10_1 >= r10_1 and #p10_0 < 5 do
      r0_7(p10_0, r0_5(p10_1[r10_1]))
      r10_1 = r10_1 + 1
    end
  end
end

local function r0_10(p11_0, p11_1, p11_2)
  if p11_1 == nil then
    return
  end
  if p11_2 then
    local r11_0 = #p11_1
    while r11_0 >= 1 and #p11_0 < 5 do
      r0_8(p11_0, r0_6(p11_1[r11_0]))
      r11_0 = r11_0 - 1
    end
  else
    local r11_1 = 1
    while #p11_1 >= r11_1 and #p11_0 < 5 do
      r0_8(p11_0, r0_6(p11_1[r11_1]))
      r11_1 = r11_1 + 1
    end
  end
end

local function r0_11()
  local r12_0, r12_1 = pcall(bm.get_current_process_startup_info)
  if not (r12_0 and r12_1 ~= nil) then
    return
  end
  local r12_2 = {}
  local r12_3 = {}
  local r12_4 = r12_1.ppid or r12_1.pid
  local r12_5, r12_6, r12_7 = pcall(bm.get_process_relationships, r12_4)
  if r12_5 then
    r0_9(r12_2, r12_6, true)
    r0_10(r12_3, r12_6, true)
  end
  if #r12_2 == 0 then
    r0_7(r12_2, r12_1.parent_image_path)
  end
  r0_7(r12_2, r12_1.image_path)
  r0_8(r12_3, r12_1.command_line)
  if r12_5 then
    r0_9(r12_2, r12_7, false)
    r0_10(r12_3, r12_7, false)
  end
  if #r12_2 > 0 then
    r0_2("ProcessTree", table.concat(r12_2, "->"))
  end
  local r12_8 = 1
  while #r12_3 >= r12_8 do
    r0_2("CmdLine" .. tostring(r12_8), r12_3[r12_8])
    r12_8 = r12_8 + 1
  end
end

local r0_12 = r0_0(this_sigattrlog[28])
local r0_13 = r0_0(this_sigattrlog[29])
local r0_14 = r0_0(this_sigattrlog[30])
local r0_15 = r0_0(this_sigattrlog[31])
local r0_16 = r0_0(this_sigattrlog[32])
local r0_17 = r0_0(this_sigattrlog[33])
local r0_18 = r0_0(this_sigattrlog[34])
local r0_19 = r0_0(this_sigattrlog[35]) or r0_0(this_sigattrlog[36])
local r0_20 = r0_0(this_sigattrlog[1])
local r0_21 = r0_0(this_sigattrlog[2])
local r0_22 = r0_0(this_sigattrlog[3])
local r0_23 = r0_0(this_sigattrlog[10])
local r0_24 = r0_0(this_sigattrlog[12])
local r0_25 = r0_0(this_sigattrlog[11])
local r0_26 = r0_0(this_sigattrlog[4])
local r0_27 = r0_0(this_sigattrlog[5])
local r0_28 = r0_0(this_sigattrlog[13])
local r0_29 = r0_0(this_sigattrlog[9])
local r0_30 = r0_0(this_sigattrlog[6])
local r0_31 = r0_0(this_sigattrlog[7])
local r0_32 = r0_0(this_sigattrlog[8])
local r0_33 = r0_20 or r0_21 or r0_22 or r0_23 or r0_24
local r0_34 = r0_25 or r0_26 or r0_24
local r0_35 = r0_27 or r0_28
local r0_36 = r0_29 or r0_20 or r0_26 or r0_25 or r0_23 or r0_24
local r0_37 = r0_30 or r0_31 or r0_32 or r0_20 or r0_23 or r0_25 or r0_26 or r0_24
local r0_38 = r0_0(this_sigattrlog[14])
local r0_39 = r0_0(this_sigattrlog[15])
local r0_40 = r0_0(this_sigattrlog[16])
local r0_41 = r0_0(this_sigattrlog[17])
local r0_42 = r0_0(this_sigattrlog[18])
local r0_43 = r0_0(this_sigattrlog[19])
local r0_44 = r0_0(this_sigattrlog[20])
local r0_45 = r0_0(this_sigattrlog[21])
local r0_46 = r0_0(this_sigattrlog[22])
local r0_47 = r0_0(this_sigattrlog[23])
local r0_48 = r0_0(this_sigattrlog[24])
local r0_49 = r0_0(this_sigattrlog[25])
local r0_50 = r0_0(this_sigattrlog[26])
local r0_51 = r0_0(this_sigattrlog[27])
local r0_52 = r0_41
  or r0_42
  or r0_43
  or r0_44
  or r0_45
  or r0_46
  or r0_47
  or r0_48
  or r0_49
  or r0_50
  or r0_51
local r0_53 = r0_41 or r0_42 or r0_43 or r0_44 or r0_45 or r0_46 or r0_47 or r0_48 or r0_50 or r0_51
local r0_54 = r0_0(this_sigattrlog[37])
local r0_55 = r0_0(this_sigattrlog[55])
local r0_56 = r0_0(this_sigattrlog[38])
local r0_57 = r0_0(this_sigattrlog[56])
local r0_58 = r0_0(this_sigattrlog[39])
local r0_59 = r0_0(this_sigattrlog[57])
local r0_60 = r0_0(this_sigattrlog[41])
local r0_61 = r0_0(this_sigattrlog[59])
local r0_62 = r0_0(this_sigattrlog[40])
local r0_63 = r0_0(this_sigattrlog[58])
local r0_64 = r0_54 or r0_55 or r0_56 or r0_57 or r0_58 or r0_59 or r0_60 or r0_61 or r0_62 or r0_63
local r0_65 = r0_55 or r0_56 or r0_57 or r0_59 or r0_60 or r0_61 or r0_62 or r0_63
local r0_66 = r0_0(this_sigattrlog[42])
local r0_67 = r0_0(this_sigattrlog[60])
local r0_68 = r0_0(this_sigattrlog[43])
local r0_69 = r0_0(this_sigattrlog[61])
local r0_70 = r0_0(this_sigattrlog[44])
local r0_71 = r0_0(this_sigattrlog[62])
local r0_72 = r0_0(this_sigattrlog[45])
local r0_73 = r0_0(this_sigattrlog[63])
local r0_74 = r0_66 or r0_67 or r0_68 or r0_69 or r0_70 or r0_71 or r0_72 or r0_73
local r0_75 = r0_67 or r0_68 or r0_69 or r0_71 or r0_73
local r0_76 = r0_0(this_sigattrlog[46])
local r0_77 = r0_0(this_sigattrlog[64])
local r0_78 = r0_76 or r0_77
local r0_79 = r0_77
local r0_80 = r0_0(this_sigattrlog[37])
local r0_81 = r0_0(this_sigattrlog[55])
local r0_82 = r0_0(this_sigattrlog[39])
local r0_83 = r0_0(this_sigattrlog[57])
local r0_84 = r0_0(this_sigattrlog[42])
local r0_85 = r0_0(this_sigattrlog[60])
local r0_86 = r0_0(this_sigattrlog[43])
local r0_87 = r0_0(this_sigattrlog[61])
local r0_88 = r0_0(this_sigattrlog[45])
local r0_89 = r0_0(this_sigattrlog[63])
local r0_90 = r0_0(this_sigattrlog[44])
local r0_91 = r0_0(this_sigattrlog[62])
local r0_92 = r0_0(this_sigattrlog[47])
local r0_93 = r0_0(this_sigattrlog[65])
local r0_94 = r0_0(this_sigattrlog[48])
local r0_95 = r0_0(this_sigattrlog[66])
local r0_96 = r0_0(this_sigattrlog[49])
local r0_97 = r0_0(this_sigattrlog[67])
local r0_98 = r0_0(this_sigattrlog[50])
local r0_99 = r0_0(this_sigattrlog[68])
local r0_100 = r0_0(this_sigattrlog[51])
local r0_101 = r0_0(this_sigattrlog[69])
local r0_102 = r0_0(this_sigattrlog[52])
local r0_103 = r0_0(this_sigattrlog[70])
local r0_104 = r0_0(this_sigattrlog[71])
local r0_105 = r0_0(this_sigattrlog[53])
local r0_106 = r0_0(this_sigattrlog[72])
local r0_107 = r0_0(this_sigattrlog[54])
local r0_108 = r0_80
  or r0_81
  or r0_82
  or r0_83
  or r0_84
  or r0_85
  or r0_86
  or r0_87
  or r0_88
  or r0_89
  or r0_90
  or r0_91
  or r0_92
  or r0_93
  or r0_94
  or r0_95
  or r0_96
  or r0_97
  or r0_98
  or r0_99
  or r0_100
  or r0_101
  or r0_102
  or r0_103
  or r0_62
  or r0_63
  or r0_104
  or r0_105
  or r0_106
  or r0_107
local r0_109 = r0_81
  or r0_83
  or r0_85
  or r0_86
  or r0_87
  or r0_91
  or r0_89
  or r0_92
  or r0_93
  or r0_94
  or r0_95
  or r0_96
  or r0_98
  or r0_100
  or r0_102
  or r0_62
  or r0_63
  or r0_104
  or r0_105
  or r0_106
  or r0_107
local r0_110 = r0_33 and r0_38 and r0_64
local r0_111 = r0_34 and r0_39 and r0_74
local r0_112 = r0_35 and r0_40 and r0_78
local r0_113 = r0_37 and r0_52 and r0_108
local r0_114 = r0_52 or r0_38 or r0_39
local r0_115 = r0_64 or r0_74 or r0_108
local r0_116 = r0_36 and r0_114 and r0_115
local r0_117 = r0_110 or r0_111 or r0_112 or r0_113 or r0_116
local r0_118 = r0_1(r0_12, r0_65, r0_53) >= 2
local r0_119 = r0_1(r0_13, r0_75, r0_53) >= 2
local r0_120 = r0_1(r0_14, r0_79, r0_53) >= 2
local r0_121 = r0_1(r0_16, r0_109, r0_53) >= 2
local r0_122 = r0_1(r0_18, r0_109, r0_53) >= 2
local r0_123 = r0_1
r0_123 = r0_123(r0_15 or r0_17 or r0_19, r0_109, r0_53) >= 1
local r0_124 = r0_110 and r0_12 and r0_118
  or r0_111 and r0_13 and r0_119
  or r0_112 and r0_14 and r0_120
  or (r0_113 or r0_116) and r0_15 and r0_123
  or r0_116 and r0_18 and r0_122
  or r0_117 and r0_16 and r0_121
  or r0_117 and r0_17 and r0_123
  or r0_117 and r0_19 and r0_123
if r0_124 then
  local r0_125 = r0_11
  r0_125()
  r0_125 = r0_3
  r0_125(this_sigattrlog[1], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[2], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[3], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[4], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[5], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[6], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[7], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[8], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[9], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[10], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[11], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[12], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[13], "PackageControlledParent")
  r0_125 = r0_3
  r0_125(this_sigattrlog[14], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[15], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[16], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[17], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[18], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[19], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[20], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[21], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[22], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[23], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[24], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[25], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[26], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[27], "SecretArtifact")
  r0_125 = r0_3
  r0_125(this_sigattrlog[28], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[29], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[30], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[31], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[32], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[33], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[34], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[35], "NetworkUrl")
  r0_125 = r0_3
  r0_125(this_sigattrlog[36], "NetworkUrl")
  r0_125 = r0_4
  r0_125(this_sigattrlog[37])
  r0_125 = r0_4
  r0_125(this_sigattrlog[38])
  r0_125 = r0_4
  r0_125(this_sigattrlog[39])
  r0_125 = r0_4
  r0_125(this_sigattrlog[40])
  r0_125 = r0_4
  r0_125(this_sigattrlog[41])
  r0_125 = r0_4
  r0_125(this_sigattrlog[42])
  r0_125 = r0_4
  r0_125(this_sigattrlog[43])
  r0_125 = r0_4
  r0_125(this_sigattrlog[44])
  r0_125 = r0_4
  r0_125(this_sigattrlog[45])
  r0_125 = r0_4
  r0_125(this_sigattrlog[46])
  r0_125 = r0_4
  r0_125(this_sigattrlog[47])
  r0_125 = r0_4
  r0_125(this_sigattrlog[48])
  r0_125 = r0_4
  r0_125(this_sigattrlog[67])
  r0_125 = r0_4
  r0_125(this_sigattrlog[68])
  r0_125 = r0_4
  r0_125(this_sigattrlog[69])
  r0_125 = r0_4
  r0_125(this_sigattrlog[70])
  r0_125 = r0_4
  r0_125(this_sigattrlog[71])
  r0_125 = r0_4
  r0_125(this_sigattrlog[72])
  r0_125 = r0_4
  r0_125(this_sigattrlog[55])
  r0_125 = r0_4
  r0_125(this_sigattrlog[56])
  r0_125 = r0_4
  r0_125(this_sigattrlog[57])
  r0_125 = r0_4
  r0_125(this_sigattrlog[58])
  r0_125 = r0_4
  r0_125(this_sigattrlog[59])
  r0_125 = r0_4
  r0_125(this_sigattrlog[60])
  r0_125 = r0_4
  r0_125(this_sigattrlog[61])
  r0_125 = r0_4
  r0_125(this_sigattrlog[62])
  r0_125 = r0_4
  r0_125(this_sigattrlog[63])
  r0_125 = r0_4
  r0_125(this_sigattrlog[64])
  r0_125 = r0_4
  r0_125(this_sigattrlog[65])
  r0_125 = r0_4
  r0_125(this_sigattrlog[66])
  r0_125 = r0_4
  r0_125(this_sigattrlog[49])
  r0_125 = r0_4
  r0_125(this_sigattrlog[50])
  r0_125 = r0_4
  r0_125(this_sigattrlog[51])
  r0_125 = r0_4
  r0_125(this_sigattrlog[52])
  r0_125 = r0_4
  r0_125(this_sigattrlog[53])
  r0_125 = r0_4
  r0_125(this_sigattrlog[54])
  r0_125 = mp
  return r0_125.INFECTED
end
return mp.CLEAN
