-- Threat: !InfrastructureShared
-- Name: 1729f65c019c
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("scpt:WebShellObf_")
if #l_0_0 < 3 then
  return mp.CLEAN
end
return mp.INFECTED
