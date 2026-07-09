-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b32becc17b\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if not (string.find)((string.lower)(l_0_0), "\\wmiprvse.exe", 1, true) then
  return mp.CLEAN
end
if not IsTechniqueObservedGlobal("NetQosDotnetWmiClientObserved", true) then
  return mp.CLEAN
end
local l_0_1 = 120
AddTechniqueGlobal("NetQosProviderInvoked", l_0_1)
;
(bm.add_related_string)("netqos_provider", "qoswmi.dll", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1562.004", "netqos_provider_invoked", 28800)
return mp.INFECTED

