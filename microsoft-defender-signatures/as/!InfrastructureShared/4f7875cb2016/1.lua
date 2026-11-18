-- Threat: !InfrastructureShared
-- Name: 4f7875cb2016
-- Type: 21

if not peattributes.hasappendeddata then
  return mp.CLEAN
end
if not peattributes.isvbpcode then
  return mp.CLEAN
end
if not peattributes.dirty_wx_branch then
  return mp.CLEAN
end
return mp.INFECTED
