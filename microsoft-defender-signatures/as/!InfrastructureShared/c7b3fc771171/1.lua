-- Threat: !InfrastructureShared
-- Name: c7b3fc771171
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_0 ~= nil then
  if string.sub(l_0_0, -4) == ".php" then
    do
      local l_0_1 = {
        "/image",
        "/img",
        "/media",
        "/file",
        "/gallery",
        "/misc",
        "/photo",
        "/assets",
        "/upload"
      }
      for l_0_2, l_0_3 in ipairs(l_0_1) do
        if string.find(l_0_0, l_0_3, 1, true) then
          return mp.INFECTED
        end
      end
    end
  elseif string.match(l_0_0, "(.+.php.+%a%a%a)") then
    local l_0_4 = string.sub(l_0_0, -5)
    l_0_4 = string.match(l_0_4, "%.(.*)")
    local l_0_5 = {
      "jpg",
      "jpeg",
      "png",
      "gif",
      "pdf"
    }
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if l_0_7 == l_0_4 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
