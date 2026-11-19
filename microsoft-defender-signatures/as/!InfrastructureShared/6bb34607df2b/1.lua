-- Threat: !InfrastructureShared
-- Name: 6bb34607df2b
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
  if string.match(l_0_0, "(.+conf.+.php)") then
    return mp.INFECTED
  else
    local l_0_1 = {
      ".conf",
      ".sql",
      ".pwd",
      ".bash_history",
      ".htpasswd",
      ".mysql_history",
      "backup",
      "priv",
      "config"
    }
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if string.find(l_0_0, l_0_3, 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
