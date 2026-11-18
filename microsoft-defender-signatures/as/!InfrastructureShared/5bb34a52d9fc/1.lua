-- Threat: !InfrastructureShared
-- Name: 5bb34a52d9fc
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomNotePattern(1) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
