-- Threat: !InfrastructureShared
-- Name: 18fb3ed23c4f0
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("UACBypassExp.T!regset") > 0 then
  local l_0_0 = MpCommon.GetPersistContextNoPath("UACBypassExp.T!regset")
  if l_0_0 then
    for l_0_1, l_0_2 in ipairs(l_0_0) do
      local l_0_3 = string.match(string.lower(l_0_2), " (.+)$")
      for l_0_4 = 1, mp.SIGATTR_LOG_SZ do
        if sigattr_head[l_0_4].matched and sigattr_head[l_0_4].attribute == 16400 then
          local l_0_5 = string.lower(sigattr_head[l_0_4].utf8p2)
          l_0_5 = string.gsub(l_0_5, "\"", "")
          if string.len(l_0_5) > 4 and string.find(l_0_5, string.lower(l_0_2), 1, true) then
            return mp.INFECTED
          end
          local l_0_6 = string.match(string.lower(sigattr_head[l_0_4].utf8p2), " (.+)$")
          if l_0_6 and l_0_3 and string.len(l_0_6) > 4 and l_0_6 == l_0_3 then
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
