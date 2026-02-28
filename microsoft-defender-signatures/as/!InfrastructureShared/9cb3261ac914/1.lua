local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = "Env-"
L2_1 = L0_1.ppid
L1_1 = L1_1 .. L2_1
L2_1 = GetRollingQueue
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1.ppid
L4_1 = "pid:(%w+),ProcessStart:(%w+)"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "/proc/"
L5_1 = L2_1
L6_1 = "/environ"
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = sysio
L5_1 = L5_1.IsFileExists
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.ReadFile
L6_1 = L4_1
L7_1 = 0
L8_1 = 8192
L5_1 = L5_1(L6_1, L7_1, L8_1)
L6_1 = sysio
L6_1 = L6_1.GetLastResult
L6_1 = L6_1()
L6_1 = L6_1.Success
if not L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = StringSplit
L7_1 = L5_1
L8_1 = "%z"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = ipairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = string
  L12_1 = L12_1.find
  L13_1 = L11_1
  L14_1 = "="
  L15_1 = 1
  L16_1 = true
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  L13_1 = string
  L13_1 = L13_1.sub
  L14_1 = L11_1
  L15_1 = 1
  L16_1 = L12_1 - 1
  L13_1 = L13_1(L14_1, L15_1, L16_1)
  L14_1 = string
  L14_1 = L14_1.sub
  L15_1 = L11_1
  L16_1 = L12_1 + 1
  L14_1 = L14_1(L15_1, L16_1)
  L15_1 = AppendToRollingQueue
  L16_1 = L1_1
  L17_1 = L13_1
  L18_1 = L14_1
  L15_1(L16_1, L17_1, L18_1)
  if L13_1 == "LD_PRELOAD" or L13_1 == "LD_LIBRARY_PATH" or L13_1 == "LD_AUDIT" then
    L15_1 = bm
    L15_1 = L15_1.trigger_sig
    L16_1 = "EnvVar:"
    L17_1 = L13_1
    L16_1 = L16_1 .. L17_1
    L17_1 = L14_1
    L15_1(L16_1, L17_1)
  end
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
