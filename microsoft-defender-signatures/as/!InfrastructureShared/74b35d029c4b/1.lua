-- Threat: !InfrastructureShared
-- Name: 74b35d029c4b
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  for l_0_1 = 1, mp.SIGATTR_LOG_SZ do
    if sigattr_head[l_0_1].matched and sigattr_head[l_0_1].attribute == 16384 and sigattr_head[l_0_1].utf8p1 ~= nil and sigattr_head[l_0_1].utf8p2 ~= nil then
      local l_0_2 = string.lower(sigattr_head[l_0_1].utf8p1)
      local l_0_3 = string.lower(sigattr_head[l_0_1].utf8p2)
      if l_0_0 == l_0_2 and string.find(l_0_2, "appdata\\local\\temp\\rar$", 1, true) then
        local l_0_4 = string.match(l_0_3, "fsize:(%d+)")
        if l_0_4 ~= nil then
          local l_0_5 = tonumber(l_0_4)
          if l_0_5 <= 1000000000 and 500000000 <= l_0_5 then
            if this_sigattrlog[1].utf8p2 ~= nil then
              local l_0_6 = "|.7z|.zip|.rar|"
              local l_0_7 = string.lower(this_sigattrlog[1].utf8p2)
              bm_AddRelatedFileFromCommandLine(l_0_7, l_0_6)
            end
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
