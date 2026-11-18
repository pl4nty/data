-- Threat: !InfrastructureShared
-- Name: a061cfaaf9cd
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
