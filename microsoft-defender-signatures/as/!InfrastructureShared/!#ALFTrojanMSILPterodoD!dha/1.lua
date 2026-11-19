-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:MSIL/Pterodo.D!dha
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & Lua:FileInsideAppDataLocalFolder

if mp.HEADERPAGE_SZ < 4096 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 % 34 ~= 0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.getfilename, mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 then
  if not l_0_2:find("\\appdata\\local\\iconscache.db", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = tostring(headerpage)
  if string.match(string.sub(l_0_3, 1, 34), "^" .. ("%x"):rep(32) .. "\r\n") == nil then
    return mp.CLEAN
  end
  if string.match(string.sub(l_0_3, 4047, 4080), "^" .. ("%x"):rep(32) .. "\r\n") == nil then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
