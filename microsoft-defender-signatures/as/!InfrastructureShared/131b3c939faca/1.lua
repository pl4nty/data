-- Threat: !InfrastructureShared
-- Name: 131b3c939faca
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
for l_0_5 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_5].matched and sigattr_head[l_0_5].wp1 ~= nil and sigattr_head[l_0_5].wp1 ~= "" then
    l_0_0 = sigattr_head[l_0_5].utf8p1
    if string.len(l_0_0) > 15 then
      if sigattr_head[l_0_5].attribute == 16384 and l_0_1 == nil then
        l_0_1 = l_0_0:match("\\(%l%l%l%l%l%l%l%l%l%l%l%l).exe")
      end
      if sigattr_head[l_0_5].attribute == 16393 then
        if l_0_2 == nil then
          l_0_4 = l_0_0:match("\\CURRENTVERSION\\RUN\\\\(%l%l%l%l%l%l%l%l%l%l%l%l)")
          if l_0_4 ~= nil and sigattr_head[l_0_5].wp2 ~= nil and sigattr_head[l_0_5].wp2 ~= "" then
            l_0_2 = string.match(sigattr_head[l_0_5].utf8p2, "\\(%l%l%l%l%l%l%l%l%l%l%l%l).exe")
            if l_0_2 ~= nil and l_0_2 ~= l_0_4 then
              l_0_2 = nil
            end
          end
        end
        if l_0_3 == nil then
          l_0_3 = l_0_0:match("\\CURRENTVERSION\\\\(%l%l%l%l%l%l%l%l%l%l%l%l)")
        end
      end
    end
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_1 == l_0_3 and l_0_2 == l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
