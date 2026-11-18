-- Threat: !InfrastructureShared
-- Name: fe782c43f466
-- Type: 21

if peattributes.reads_vdll_code and (peattributes.suspicious_image_version or peattributes.uses_access_violation or peattributes.uses_privinstr or peattributes.deep_analysis or peattributes.enable_vmm_grow) and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
