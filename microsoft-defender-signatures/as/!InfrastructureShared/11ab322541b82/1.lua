-- Threat: !InfrastructureShared
-- Name: 11ab322541b82
-- Type: 21

if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
local l_0_0 = {}
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_2 = sigattr_tail[l_0_1]
  if l_0_2.attribute == 16435 then
    local l_0_3 = l_0_2.utf8p1
    if l_0_3 then
      local l_0_4 = string.format("virtualalloc: %s", l_0_3)
      if not l_0_0[l_0_4] then
        bm.add_related_string("cs_al", l_0_4, bm.RelatedStringBMReport)
        l_0_0[l_0_4] = true
      end
    end
  end
  if l_0_2.attribute == 16505 then
    local l_0_5 = l_0_2.utf8p2
    if l_0_5 then
      local l_0_6 = string.match(l_0_5, "regionsize:(%d+)")
      if l_0_6 then
        local l_0_7 = string.format("protectvm: %s", l_0_6)
        if not l_0_0[l_0_7] then
          bm.add_related_string("cs_al", l_0_7, bm.RelatedStringBMReport)
          l_0_0[l_0_7] = true
        end
      end
    end
  end
  if l_0_2.attribute == 16523 then
    local l_0_8 = l_0_2.utf8p1
    if l_0_8 then
      local l_0_9 = string.format("mapview: %s", l_0_8)
      if not l_0_0[l_0_9] then
        bm.add_related_string("cs_al", l_0_9, bm.RelatedStringBMReport)
        l_0_0[l_0_9] = true
      end
    end
  end
end
local l_0_10 = false
for l_0_11, l_0_12 in pairs(l_0_0) do
  l_0_10 = true
  break
end
if not l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED
