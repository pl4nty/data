-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a78f_1245.luac 

-- params : ...
-- function num : 0
if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if elfhdr.phnum ~= 3 or elfhdr.shnum ~= 0 then
  return mp.CLEAN
end
local l_0_0 = 1
local l_0_1 = 62
local l_0_2 = 3
local l_0_3 = elfhdr.ident
local l_0_4 = (string.byte)(l_0_3, 6)
if l_0_4 ~= l_0_0 or elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 then
  return mp.CLEAN
end
local l_0_5 = nil
if hstrlog[1] ~= nil and (hstrlog[1]).matched then
  l_0_5 = (hstrlog[1]).location
else
  if hstrlog[2] ~= nil and (hstrlog[2]).matched then
    l_0_5 = (hstrlog[2]).location
  else
    if hstrlog[3] ~= nil and (hstrlog[3]).matched then
      l_0_5 = (hstrlog[3]).location
    else
      if hstrlog[4] ~= nil and (hstrlog[4]).matched then
        l_0_5 = (hstrlog[4]).location
      else
        if hstrlog[5] ~= nil and (hstrlog[5]).matched then
          l_0_5 = (hstrlog[5]).location
        else
          if hstrlog[6] ~= nil and (hstrlog[6]).matched then
            l_0_5 = (hstrlog[6]).location
          else
            if hstrlog[7] ~= nil and (hstrlog[7]).matched then
              l_0_5 = (hstrlog[7]).location
            else
              if hstrlog[8] ~= nil and (hstrlog[8]).matched then
                l_0_5 = (hstrlog[8]).location
              else
                if hstrlog[9] ~= nil and (hstrlog[9]).matched then
                  l_0_5 = (hstrlog[9]).location
                else
                  if hstrlog[10] ~= nil and (hstrlog[10]).matched then
                    l_0_5 = (hstrlog[10]).location
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = nil
for l_0_10 = 1, elfhdr.phnum do
  l_0_6 = ephdrs[l_0_10]
  if l_0_6 and l_0_6.type == 1 and l_0_6.vaddr < elfhdr.entry and elfhdr.entry < l_0_6.vaddr + l_0_6.memsz and l_0_6.vaddr + l_0_5 == elfhdr.entry then
    return mp.INFECTED
  end
end
return mp.CLEAN

