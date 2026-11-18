-- Threat: !InfrastructureShared
-- Name: 99b3d0140a37
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = ""
local l_0_2 = 0
for l_0_3 = 1, l_0_0 do
  if sigattr_tail[l_0_3].attribute == 16386 then
    local l_0_4 = sigattr_tail[l_0_3].utf8p2:lower()
    local l_0_5 = sigattr_tail[l_0_3].utf8p1:lower()
    if l_0_5:sub(1, #l_0_4) == l_0_4 then
      local l_0_6 = l_0_5:sub(#l_0_4 + 1)
      if l_0_6 and mp.GetExtensionClass(l_0_6) == 0 then
        if l_0_1 == nil then
          l_0_1 = l_0_6
          l_0_2 = l_0_2 + 1
        elseif l_0_6 == l_0_1 then
          l_0_2 = l_0_2 + 1
        end
      end
    end
  end
  if 5 <= l_0_2 and l_0_1 and isKnownRansomExtension(l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN
