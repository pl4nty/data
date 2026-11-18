-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspExecInDiskImage
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.getfilesize()
  if 5242880 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.getfilename())
  if l_0_2 == nil or string.len(l_0_2) < 10 then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2:sub(-4)
  local l_0_4 = {
    [".exe"] = true,
    [".scr"] = true,
    [".pif"] = true
  }
  if l_0_4[l_0_3] == true then
    if not l_0_2:find(".iso->", 1, true) and not l_0_2:find(".vhd->", 1, true) and not l_0_2:find("ppkg->", 1, true) and not l_0_2:find(".img->", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
