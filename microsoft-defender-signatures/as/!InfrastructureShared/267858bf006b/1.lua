-- Threat: !InfrastructureShared
-- Name: 267858bf006b
-- Type: 21

if true == peattributes.isdll then
  local l_0_0 = mp.getfilesize()
  if 400000 <= l_0_0 and l_0_0 <= 750000 then
    local l_0_1 = string.lower(mp.getfilename())
    if l_0_1:find("\\appdata\\roaming\\microsoft\\windows\\templates\\", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
