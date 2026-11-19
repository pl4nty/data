-- Threat: !InfrastructureShared
-- Name: 1957876d3e422
-- Type: 21

if pehdr.NumberOfSections < 5 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\139|$\016\131\239\b\133\201t\0060\023IO\235",
    xray_type = 11,
    bytes_to_decrypt = 0
  },
  {
    sig = "\139|$\016\131\239\006\133\201t\0060\023IO\235",
    xray_type = 11,
    bytes_to_decrypt = 0
  }
}
local l_0_1 = pe.xray_block(l_0_0, 2, 1, 0, 8192)
if l_0_1 == mp.INFECTED then
  return mp.INFECTED
end
if pehdr.NumberOfSections >= 5 then
  if pesecs[5].VirtualSize >= 9216 then
    l_0_1 = pe.xray_block(l_0_0, 2, 4, 6656, 9216)
    if l_0_1 == mp.INFECTED then
      return mp.INFECTED
    end
  end
  l_0_1 = pe.xray_block(l_0_0, 2, 4, 2048, 5120)
  if l_0_1 == mp.INFECTED then
    return mp.INFECTED
  end
end
if pehdr.NumberOfSections >= 7 then
  l_0_1 = pe.xray_block(l_0_0, 2, 2, 0, 1024)
  if l_0_1 == mp.INFECTED then
    return mp.INFECTED
  end
  l_0_1 = pe.xray_block(l_0_0, 2, 6, 0, 2048)
  if l_0_1 == mp.INFECTED then
    return mp.INFECTED
  end
  if 5120 <= pesecs[7].VirtualSize then
    l_0_1 = pe.xray_block(l_0_0, 2, 6, 4096, 5120)
    if l_0_1 == mp.INFECTED then
      return mp.INFECTED
    end
  end
  if pehdr.NumberOfSections >= 8 then
    l_0_1 = pe.xray_block(l_0_0, 2, 7, 0, 1024)
    if l_0_1 == mp.INFECTED then
      return mp.INFECTED
    end
    if 5120 <= pesecs[8].VirtualSize then
      l_0_1 = pe.xray_block(l_0_0, 2, 7, 4096, 5120)
      if l_0_1 == mp.INFECTED then
        return mp.INFECTED
      end
    end
  end
  if pehdr.NumberOfSections >= 9 and 5120 <= pesecs[9].VirtualSize then
    l_0_1 = pe.xray_block(l_0_0, 2, 8, 4096, 5120)
    if l_0_1 == mp.INFECTED then
      return mp.INFECTED
    end
  end
end
return pe.xray_block(l_0_0, 2, 5, 0, 4096)
