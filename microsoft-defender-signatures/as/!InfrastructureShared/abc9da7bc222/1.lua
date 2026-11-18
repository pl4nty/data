-- Threat: !InfrastructureShared
-- Name: abc9da7bc222
-- Type: 21

if mp.get_mpattribute("CURE:Virus:Wi64/Expiro.CB1") then
  return mp.INFECTED
end
return mp.CLEAN
