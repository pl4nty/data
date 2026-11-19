-- Threat: !InfrastructureShared
-- Name: 2229fc105153
-- Type: 21

if string.find(mp.getfilename(), "(Rtf0000)", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
