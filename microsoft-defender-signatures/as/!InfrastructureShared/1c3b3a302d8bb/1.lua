-- Threat: !InfrastructureShared
-- Name: 1c3b3a302d8bb
-- Type: 21

local l_0_0, l_0_1
for l_0_2 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_2].matched and sigattr_tail[l_0_2].attribute == 16384 then
    l_0_0 = sigattr_tail[l_0_2].utf8p1
    if l_0_0 then
      l_0_0 = string.lower(l_0_0)
      if l_0_0 then
        l_0_1 = string.len(l_0_0)
        if 16 <= l_0_1 and string.find(l_0_0, "\\windows", 1, true) == nil and string.sub(l_0_0, -4) == ".exe" then
          local l_0_3, l_0_4 = string.match(l_0_0, "^%l:\\(%w+)\\(%w+)%.exe")
          if l_0_3 ~= nil and l_0_4 ~= nil and l_0_3 == l_0_4 then
            bm.add_related_file(sigattr_tail[l_0_2].utf8p1)
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.INFECTED
