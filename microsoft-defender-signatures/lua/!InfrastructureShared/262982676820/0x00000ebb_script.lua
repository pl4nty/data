-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\262982676820\0x00000ebb_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsIISWmiAmsiScan") then
  return mp.CLEAN
end
local l_0_0 = nil
local l_0_1 = (mp.GetBruteMatchData)()
if l_0_1.is_header then
  l_0_0 = (tostring(headerpage)):lower()
else
  l_0_0 = (tostring(footerpage)):lower()
end
local l_0_2 = l_0_0:match("setpropvalue.commandline%(\"(.*)\"%);")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_3 then
  TT_SendBMSigTrigger(l_0_3, "IISWMIExec", l_0_2)
end
set_research_data("IISWMIExec", l_0_2, false)
return mp.INFECTED

