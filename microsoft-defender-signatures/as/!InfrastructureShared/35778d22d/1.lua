-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35778d22d\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 10 and not (mp.IsTrustedFile)(false) and not (mp.IsKnownFriendlyFile)((mp.getfilename)(), true, true) then
  return mp.INFECTED
end
;
(pe.set_peattribute)("hstr_exhaustive", true)
;
(pe.set_peattribute)("enable_vmm_grow", true)
;
(pe.set_peattribute)("deep_analysis", true)
;
(pe.set_peattribute)("disable_seh_limit", true)
;
(pe.set_peattribute)("disable_apicall_limit", true)
;
(pe.reemulate)()
return mp.CLEAN

