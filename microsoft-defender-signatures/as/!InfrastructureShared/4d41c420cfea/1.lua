-- Threat: !InfrastructureShared
-- Name: 4d41c420cfea
-- Type: 21

if peattributes.isdll and peattributes.executble_image and mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
