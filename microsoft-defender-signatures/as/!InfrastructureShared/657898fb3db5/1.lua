-- Threat: !InfrastructureShared
-- Name: 657898fb3db5
-- Type: 21

if mp.get_mpattribute("SIGATTR:ASEP") and mp.get_mpattribute("SIGATTR:RegKeyWinDiag") then
  return mp.INFECTED
end
return mp.CLEAN
