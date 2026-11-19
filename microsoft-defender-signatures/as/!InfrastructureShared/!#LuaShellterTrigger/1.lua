-- Threat: !InfrastructureShared
-- Name: !#Lua:ShellterTrigger
-- Type: 10
-- MpAttributes: MpHasExpensiveLoop & !PEPCODE:HasDigitalSignature

if not (peattributes.isexe and not peattributes.packed and peattributes.no_exception and peattributes.no_exports and peattributes.no_security and peattributes.x86_image and peattributes.suspicious_image_version) or not peattributes.dt_error_heur_exit_criteria then
  return mp.CLEAN
end
if mp.getfilesize() > 3145728 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_FULL))
if string.find(l_0_0, "\\windows\\", 1, true) or string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
if not mp.get_mpattribute("pea_enable_vmm_grow") or not mp.get_mpattribute("pea_deep_analysis") then
  pe.set_peattribute("enable_vmm_grow", true)
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
end
return mp.CLEAN
