-- Threat: Ransom:Win32/Troldesh.D
-- Type: 13

if mp.get_mpattribute("TELPER:KPAT:VirTool:Win32/ObfuscatorGd!decblob") then
  if string.len(mp.getfilename()) < 8 then
    return mp.CLEAN
  end
  local l_0_0 = string.lower(mp.getfilename())
  if string.find(l_0_0, "csrss.exe%->%(nsis") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
