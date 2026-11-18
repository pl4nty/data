-- Threat: !InfrastructureShared
-- Name: aa29f42334aa
-- Type: 21

if mp.getfilesize() > 102400 and mp.getfilesize() < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
