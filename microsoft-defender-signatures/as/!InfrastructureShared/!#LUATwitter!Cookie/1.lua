-- Threat: !InfrastructureShared
-- Name: !#LUA:Twitter!Cookie
-- Type: 13

if mp.get_mpattribute("SCRIPT:Twitter!Cookie") then
  local l_0_0 = mp.getfilename()
  if string.find(l_0_0, "[Cc][oO][oO][kK][Ii][Ee][Ss]") ~= nil then
    mp.set_mpattribute("#Twitter!Cookie")
  end
end
return mp.CLEAN
