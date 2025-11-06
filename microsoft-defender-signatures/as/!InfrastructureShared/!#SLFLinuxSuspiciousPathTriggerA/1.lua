-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFLinuxSuspiciousPathTriggerA\1.luac 

-- params : ...
-- function num : 0
if (versioning.GetProduct)() == 24 then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 10 then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC42: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("/tmp/37090basiclevelvirus/")("/tmp/abnormal/") do
  if (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

