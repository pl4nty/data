-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxTruncatedSegments\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
for l_0_4 = 1, elfhdr.phnum do
  if (ephdrs[l_0_4]).filesz > 0 and l_0_0 < (ephdrs[l_0_4]).offset + (ephdrs[l_0_4]).filesz then
    return mp.INFECTED
  end
end
return mp.CLEAN

