-- Threat: !InfrastructureShared
-- Name: 4078011b4543
-- Type: 21

if peattributes.ismsil and peattributes.amd64_image and peattributes.no_imports then
  return mp.INFECTED
end
return mp.CLEAN
