-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspExecutableY\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC128: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC128: Unhandled construct in 'MakeBoolean' P3

if (string.find)(l_0_0, "/bin/", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or not (string.find)(l_0_0, "/applications/grass-", 1, true) or (string.find)(l_0_0, ".app/contents/resources/", 1, true)) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC164: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R6 in 'AssignReg'

  for l_0_8,l_0_9 in (".nib")(".png") do
    -- DECOMPILER ERROR at PC169: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC171: Overwrote pending register: R11 in 'AssignReg'

    local l_0_10 = ((".docx").len)(".dmg")
    -- DECOMPILER ERROR at PC177: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC178: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC179: Overwrote pending register: R14 in 'AssignReg'

    if l_0_9 ~= nil and (string.find)(".pkg", ".doc", ".ppt", true) then
      if l_0_2 then
        TrackPidAndTechnique(l_0_2, "T1036.008", "DefenseEvasion_Masquerading")
        ;
        (MpCommon.BmTriggerSig)(l_0_2, "BM_SuspMacFileWithOtherExt", l_0_3)
      end
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

