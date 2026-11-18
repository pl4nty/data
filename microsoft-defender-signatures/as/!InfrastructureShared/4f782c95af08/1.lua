-- Threat: !InfrastructureShared
-- Name: 4f782c95af08
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
