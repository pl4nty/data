local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "\\users\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = L1_1
  L4_1 = "\\"
  L5_1 = L2_1
  L3_1 = L3_1 .. L4_1 .. L5_1
  L5_1 = L1_1
  L4_1 = L1_1.match
  L6_1 = "\\users\\([^\\]+)\\"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = "kassir|quang luu|mr quang|quang luu pc|viet hoang|user|admin|lenovo|hp|asus"
  L7_1 = L5_1
  L6_1 = L5_1.find
  L8_1 = L4_1
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = TT_SendBMSigTrigger
    L7_1 = L0_1
    L8_1 = "SuspAttackerServer"
    L9_1 = "scenario:ducktail_actor_infra;filepath:"
    L10_1 = L3_1
    L9_1 = L9_1 .. L10_1
    L6_1(L7_1, L8_1, L9_1)
  end
  L7_1 = L1_1
  L6_1 = L1_1.find
  L8_1 = "\\users\\.+\\downloads"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = TrackPidAndTechnique
    L7_1 = L0_1
    L8_1 = "T1027.002"
    L9_1 = "scenario:ducktail;filepath:"
    L10_1 = L3_1
    L9_1 = L9_1 .. L10_1
    L6_1(L7_1, L8_1, L9_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
