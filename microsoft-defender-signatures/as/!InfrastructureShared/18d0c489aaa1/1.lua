-- Threat: !InfrastructureShared
-- Name: 18d0c489aaa1
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
if l_0_0.match_offset + 14 < mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
if l_0_0.is_header and headerpage[l_0_0.match_offset + 13] > 32 then
  local l_0_1 = tostring(headerpage)
  if string.match(l_0_1, "\253\028%Xm") ~= nil and string.match(l_0_1, "\004\017%Xm") ~= nil and string.match(l_0_1, "h\149%Xm") ~= nil then
    mp.set_mpattribute("SCPT:Englist.Size")
  end
  return mp.INFECTED
end
return mp.CLEAN
