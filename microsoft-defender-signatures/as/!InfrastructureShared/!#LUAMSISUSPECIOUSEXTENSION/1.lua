-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAMSISUSPECIOUSEXTENSION\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (mp.getfilesize)() > 1024000 then
  return mp.CLEAN
end
if (string.find)(l_0_0, ".pdf.msi", 1, true) ~= nil or (string.find)(l_0_0, "·pdf.zip", 1, true) ~= nil or (string.find)(l_0_0, ",jpg.iso", 1, true) ~= nil or (string.find)(l_0_0, "vhowlvtwzr.dll", 1, true) ~= nil or (string.find)(l_0_0, "_xls.exe", 1, true) ~= nil or (string.find)(l_0_0, "_docx.exe", 1, true) ~= nil or (string.find)(l_0_0, "png.scr", 1, true) ~= nil or (string.find)(l_0_0, ".pdf.arj", 1, true) ~= nil or (string.find)(l_0_0, "factura.exe", 1, true) ~= nil or (string.find)(l_0_0, "-pdf.pif", 1, true) ~= nil or (string.find)(l_0_0, "__....exe", 1, true) ~= nil or (string.find)(l_0_0, "hsbc_cus.exe", 1, true) ~= nil or (string.find)(l_0_0, "_pdf.com", 1, true) ~= nil or (string.find)(l_0_0, "·pdf.exe", 1, true) ~= nil or (string.find)(l_0_0, "_jpg.exe", 1, true) ~= nil or (string.find)(l_0_0, "_xslx.exe", 1, true) ~= nil or (string.find)(l_0_0, "ndringskommandoens sewerman.exe", 1, true) ~= nil or (string.find)(l_0_0, "-pdf.exe", 1, true) ~= nil or (string.find)(l_0_0, "_pdf__.+%.%.exe") ~= nil or (string.find)(l_0_0, "%.pdf_%d%d%d+%.exe") ~= nil or (string.find)(l_0_0, "new order_%d%d%d%d%.exe") ~= nil or (string.find)(l_0_0, "%·pdf%d%.zip") or (string.find)(l_0_0, "dhl%d%d%d%d%d%d+%.exe") or (string.find)(l_0_0, "diejc%.dll") or (string.find)(l_0_0, "pwj%.dll") or (string.find)(l_0_0, "oejfzj%.dll") or (string.find)(l_0_0, "aoshvfu%.dll") or (string.find)(l_0_0, "rfq#%d%d%d%d+%.exe") or (string.find)(l_0_0, "payment details_$%d%d,%d%d%d%.exe") or (string.find)(l_0_0, "_pdf_+%.exe") or (string.find)(l_0_0, "docs%.pdf%.%.+%.gz%.exe") or (string.find)(l_0_0, "hsbc_cus %(%d%)%.exe") or (string.find)(l_0_0, "%.pdf %(%d%d%d kb%)%.exe") or (string.find)(l_0_0, "%.xlsx%(%d%dkb%)%.exe") or (string.find)(l_0_0, "factura_%d%d%dpdf%.exe") or (string.find)(l_0_0, "pedido junio %d%d%d%d+%-%d%d%d%d%.pdf%.tar$") or (string.find)(l_0_0, "request for quotation mq%d%d%d%d%d%.exe$") then
  return mp.INFECTED
end
return mp.CLEAN

