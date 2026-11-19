-- Threat: !InfrastructureShared
-- Name: 8b788146c7a9
-- Type: 21

if peattributes.hasappendeddata and peattributes.dirty_wx_branch then
  return mp.INFECTED
end
return mp.CLEAN
