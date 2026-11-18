-- Threat: !InfrastructureShared
-- Name: 1d778632cc9ac
-- Type: 21

if peattributes.ismsil ~= true or mp.getfilesize() > 102400 then
  return mp.CLEAN
end
return mp.INFECTED
