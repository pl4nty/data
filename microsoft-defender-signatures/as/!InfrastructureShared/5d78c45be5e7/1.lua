-- Threat: !InfrastructureShared
-- Name: 5d78c45be5e7
-- Type: 21

if mp.ispackedwith("AutoIt_+") or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv") then
  return mp.INFECTED
end
return mp.CLEAN
