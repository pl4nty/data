-- Threat: !InfrastructureShared
-- Name: 2d7617eac967d
-- Type: 21

if peattributes.ismsil == true and pesecs[4].Name == ".bsS" and pesecs[4].Characteristics == 3221225472 then
  return mp.INFECTED
end
return mp.CLEAN
