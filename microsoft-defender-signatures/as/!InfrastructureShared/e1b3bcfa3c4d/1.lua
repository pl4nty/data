-- Threat: !InfrastructureShared
-- Name: e1b3bcfa3c4d
-- Type: 21

if this_sigattrlog[2].matched and string.lower(string.sub(this_sigattrlog[2].utf8p1, -22)) == "easeofaccessdialog.exe" then
  return mp.CLEAN
end
return mp.INFECTED
