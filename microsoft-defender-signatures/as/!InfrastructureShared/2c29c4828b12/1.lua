-- Threat: !InfrastructureShared
-- Name: 2c29c4828b12
-- Type: 21

if string.find(string.lower(mp.getfilename()), ".htaccess") ~= nil then
  local l_0_0 = mp.GetBruteMatchData()
  local l_0_1 = 256
  local l_0_2 = ""
  if l_0_0.is_header then
    l_0_2 = tostring(headerpage):sub(l_0_0.match_offset, l_0_0.match_offset + l_0_1)
  else
    l_0_2 = tostring(footerpage):sub(l_0_0.match_offset, l_0_0.match_offset + l_0_1)
  end
  l_0_2 = string.lower(l_0_2)
  local l_0_3 = {
    "x-httpd-php .jpg",
    "x-httpd-php .jpeg",
    "x-httpd-php .png",
    "x-httpd-php .gif",
    "x-httpd-php .htaccess"
  }
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if string.find(l_0_2, l_0_5, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
