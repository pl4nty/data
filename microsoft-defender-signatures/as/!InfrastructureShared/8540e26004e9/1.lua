-- Threat: !InfrastructureShared
-- Name: 8540e26004e9
-- Type: 21

if mp.get_mpattribute("NativeAPIsInNonNativeApp") then
  return mp.INFECTED
end
return mp.CLEAN
