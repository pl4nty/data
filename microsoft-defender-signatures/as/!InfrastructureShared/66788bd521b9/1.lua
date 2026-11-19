-- Threat: !InfrastructureShared
-- Name: 66788bd521b9
-- Type: 21

if mp.HSTR_WEIGHT < 103 and peattributes.isexe and mp.get_mpattribute("reads_vdll_code") then
  return mp.INFECTED
end
return mp.CLEAN
