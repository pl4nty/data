-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUABackdoorWin64Capybara\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = nil
local l_0_3 = "HSTR:Backdoor:Win64/Capybara!"
if (mp.get_mpattributesubstring)(l_0_3) then
  local l_0_4 = (mp.enum_mpattributesubstring)(l_0_3)
  if not l_0_4 or not l_0_4[1] then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R5 in 'UnsetPending'

  local l_0_6 = nil
  if (string.sub)(l_0_4[1], #l_0_3 + 1) == nil then
    return mp.CLEAN
  end
  local l_0_7 = nil
  if (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE)) == nil then
    return mp.CLEAN
  end
  l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE)) .. "\\" .. l_0_7
  if not (sysio.IsFileExists)(l_0_2) then
    return mp.CLEAN
  end
end
do
  do
    ;
    (MpCommon.BmTriggerSig)(l_0_1, "Backdoor:Win64/Capybara", l_0_2)
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC94: freeLocal<0 in 'ReleaseLocals'

  end
end

