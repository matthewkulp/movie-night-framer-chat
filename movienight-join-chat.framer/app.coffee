Framer.Device.background.backgroundColor = "purple"
Framer.Device.background.backgroundColor = "#CFCFF5"


sketch = Framer.Importer.load "imported/2015.10"

Framer.DeviceView.Devices["custom"] =
	"deviceType": "phone"
	"screenWidth": 1440
	"screenHeight": 900
# 	"deviceImage": "macbook-2015-gold-nologo.jp2"
	"deviceImageWidth": 2284
	"deviceImageHeight": 1662

# Set custom device
Framer.Device.deviceType = "custom"

# Set cursor to pointer
document.body.style.cursor = "auto"

# Framer.Device.deviceType = 'fullScreen'
Framer.Device.deviceImage = ''


# Initializing
videoWidth = 1008
videoHeight = 900

chatAndParties = sketch.chatAndParties

parties = sketch.parties
join = sketch.join3

chat = sketch.chat
quit = sketch.quit
clock = sketch.clock

footer = sketch.footer
chatButton = sketch.chatButton
blueChatButton = sketch.blueChatButton
grayChatButton = sketch.grayChatButton

partiesButton = sketch.partiesButton
bluePartiesButton = sketch.bluePartiesButton
grayPartiesButton = sketch.grayPartiesButton

friendsButton = sketch.friendsButton
blueFriendsButton = sketch.blueFriendsButton
grayFriendsButton = sketch.grayFriendsButton

chatIsOpen = false
headerItemDisplaced = 5

chatAndParties.x = chatAndParties.x + parties.width

friendsButton.x = 134
blueFriendsButton.opacity = 0

chatButton.x = 363
chatButton.opacity = 0
blueChatButton.opacity = 0

partiesButton.x = 273
bluePartiesButton.opacity = 1

clock.x = clock.x + headerItemDisplaced
clock.opacity = 0

quit.x = quit.x + headerItemDisplaced
quit.opacity = 0

blueFadeInTime = .1
blueFadeInDelay = .05

africanus = sketch.africanus
siavash = sketch.siavash
siavash.opacity = 0
africanus.opacity = 0

messages = sketch.messages

y = sketch.y
o = sketch.o

y.opacity = 0
o.opacity = 0

composeMessage = sketch.composeMessage
underlineBlue = sketch.underlineBlue
underlineBlue.opacity = 0	

alonso = sketch.alonso
alonsoTimestamp = sketch.alonsoTimestamp
alonsoTimestamp.opacity = 0

bang = sketch.bang
bang.opacity = 0

bangBang = sketch.bangBang
bangBang.opacity = 0

bangBangBang = sketch.bangBangBang
bangBangBang.opacity = 0

messageHeight = 86
messageEntersY = 10

messages.y = messages.y + messageHeight + messageEntersY

y.y -= messageEntersY
o.y -= messageEntersY

composeBar = sketch.composeBar
composeBar.opacity = 0
composeBar.y += messageEntersY

# headerPrivate = sketch.headerPrivate
party1 = sketch.Party_1
party2 = sketch.Party_2
party3 = sketch.Party_3
party4 = sketch.Party_4
party5 = sketch.Party_5

partyArray = [party1, party2, party3, party4, party5]

reply = sketch.reply
cancel = sketch.cancel
compose = sketch.compose
notif = sketch.notification
notifFull = sketch.notificationFull

compose.opacity = 0
cancel.opacity = 0
cancel.rotation = -90
cancel.scale = .95

notification = sketch.notification
notifEnteredY = notifFull.y
notifFull.y += notification.height

composeOpen = true

videoFadeTime = .3
messageSlideTime = .2

dizzeeRascal = new VideoLayer
    video: "http://giant.gfycat.com/PoisedOpulentDragon.mp4"
    width: videoWidth
    height: videoHeight
    backgroundColor: 'black'

dizzeeRascal.player.autoplay = true
dizzeeRascal.player.on "ended", ->
	dizzeeRascal.player.play()

dizzeeRascal.opacity = 0

blackPirate = new VideoLayer
    video: "http://fat.gfycat.com/BlondQueasyAmericanblackvulture.mp4"
    width: videoWidth
    height: videoHeight
    backgroundColor: 'black'
	
blackPirate.player.autoplay = true
blackPirate.player.on "ended", ->
	blackPirate.player.play()

joiningParty = sketch.joiningParty
loader = sketch.loader
loadingMessage = sketch.loadingMessage
loadingMessage.opacity = 0






touchCircle = new Layer
	width: 20
	height: 20
	borderRadius: 40
	backgroundColor: 'white'
	opacity: 0
	
circleExpand = new Animation
	layer: touchCircle
	properties: 
		scale: 6
		opacity: 0
	curve: 'ease-out'
	time: .15
	
# Footer Animations
blueChatButtonFadesIn = new Animation
	layer: blueChatButton
	properties: {opacity:1}
	time: blueFadeInTime
	delay: blueFadeInDelay
	
blueChatButtonFadesOut = blueChatButtonFadesIn.reverse()

bluePartiesButtonFadesOut = new Animation
	layer: bluePartiesButton
	properties: {opacity:0}
	time: blueFadeInTime
	delay: blueFadeInDelay
	
bluePartiesButtonFadesIn = bluePartiesButtonFadesOut.reverse()

blueFriendsButtonFadesIn = new Animation
	layer: blueFriendsButton
	properties: {opacity: 1}
	time: blueFadeInTime
	delay: blueFadeInDelay
	
blueFriendsButtonFadesOut = blueFriendsButtonFadesIn.reverse()

chatButtonEnters = new Animation
	layer: chatButton
	properties: {opacity:1, x:333}
	time: .2
	
chatButtonExit = chatButtonEnters.reverse()

partiesButtonMovesLeft = new Animation
	layer: partiesButton
	properties: {x: 200}
	time: .2
	
partiesButtonMovesRight = partiesButtonMovesLeft.reverse()

friendsButtonMovesLeft = new Animation
	layer: friendsButton
	properties: {x:72}
	time: .1
	
friendsButtonMovesRight = friendsButtonMovesLeft.reverse()

# Header Animations
clockEnters = new Animation
	layer: clock
	properties: 
		x: clock.x - headerItemDisplaced 
		opacity:1
	time: .2
	
clockExits = clockEnters.reverse()

quitEnters = new Animation
	layer: quit
	properties: 
		x: quit.x - headerItemDisplaced
		opacity:1
	time: .2
	
quitExits = quitEnters.reverse()

notificationEnters = new Animation
	layer: notifFull
	properties: 
		y: notifFull.y - notification.height
	time: .3

notificationExits = notificationEnters.reverse()

replyButtonClicked = new Animation
	layer: notifFull
	properties: 
		y: notifEnteredY - compose.height
	time: .2

replyButtonExit = new Animation
	layer: reply
	properties: {opacity: 0}
	time:.2

cancelButtonIntro = new Animation
	layer: cancel
	properties: {rotation:0, opacity:1}
	time: .3	

messageSlide = new Animation
	layer: messages
	properties: 
		y: messages.y - messageHeight
	time: messageSlideTime
			



touch = (xPos, yPos) ->
	touchCircle.x = xPos
	touchCircle.y = yPos
	touchCircle.opacity = 1
	circleExpand.start()
	circleExpand.on "end", ->
		touchCircle.scale = 1

loaderDisplaceY = 24
loadingMessage.y += loaderDisplaceY

seekerBlack = sketch.seekerBlack
seekerWalking = sketch.seekerWalking
seekerDizzee = sketch.seekerDizzee
seekerStraight = sketch.seekerStraight
seekerTime = 10






spinLoader = new Animation
	layer: loader
	properties: 
		rotation: 360
	time: .4
	curve: 'linear'
	
spinLoader.start()

spinLoader.on 'end', ->
	loader.rotation = 0
	spinLoader.start()







seekersMove = ->
	seekerBlack.animate
		properties:
			width: seekerBlack.width + 32
		time: seekerTime
		curve: 'linear'
		
	seekerWalking.animate
		properties:
			width: seekerWalking.width + 32
		time: seekerTime
		curve: 'linear'
		
	seekerDizzee.animate
		properties:
			width: seekerDizzee.width + 50
		time: seekerTime
		curve: 'linear'
		
	seekerStraight.animate
		properties:
			width: seekerStraight.width + 28
		time: seekerTime
		curve: 'linear'
	
		
		




partiesExit = ->
	
	blackPirate.animate
		properties:
			opacity: 0
		time: videoFadeTime

	blackPirate.on Events.AnimationEnd, ->
		Utils.delay .2, ->
			loadingMessage.animate
				properties:
					opacity: 1
					y: loadingMessage.y - loaderDisplaceY
				time: .2
				curve: 'ease-out'
				
	chatButtonEnters.start()
	blueChatButtonFadesIn.start()			
	
	Utils.delay .05, ->
		partiesButtonMovesLeft.start()
		bluePartiesButtonFadesOut.start()

	Utils.delay .1, ->
		friendsButtonMovesLeft.start()
		
	Utils.delay 1, ->
		chatAndParties.x -= chat.width	
			
	i = 0
	for item in partyArray
		do (item) ->
			item.animate
				properties:
					opacity: 0
# 					x: item.x - 24
				time: .3
				delay: .05 * i
			i++


		
chatEnters = ->
	composeBar.animate
		properties:
			opacity: 1
			y: composeBar.y - messageEntersY
		time: .3
		delay: .4

	loadingMessage.animate
		properties:
			opacity: 0
			y: loadingMessage.y + loaderDisplaceY
		time: .2
		curve: 'ease-in'
	
	
	Utils.delay .2, ->
		quitEnters.start()
	
	Utils.delay .225, ->
		clockEnters.start()
		
		dizzeeRascal.animate
			properties:
				opacity: 1
			time: .3
			delay: .1




africanusMessage = ->
	africanus.animate
		layer: africanus
		properties: 
			opacity: 1
			y: africanus.y - messageEntersY
		time: messageSlideTime
		delay: .4
		



siavashMessage = ->
	messageSlide.start()

	messageSlide.on "end", ->
		siavash.animate
			properties: 
				opacity: 1
				y: siavash.y - messageEntersY
			time: messageSlideTime



			
typingSending = ->
	underlineBlue.opacity = 1
	composeMessage.opacity = 0	
	
	Utils.delay .4, ->
		y.opacity = 1
		
		Utils.delay .1, ->
			o.opacity = 1
	
			Utils.delay .2, ->
				messages.animate
					properties:
						y: messages.y - messageHeight
					time: .2
				
				alonsoTimestamp.animate
					properties:
						opacity: 1
						y: alonsoTimestamp.y - messageEntersY
					time: .2
					delay: messageSlideTime
	
	
				Utils.delay 1, ->
					bang.opacity = 1
					
					Utils.delay .1, ->
						bangBang.opacity = 1
						
						Utils.delay .1, ->
							bangBangBang.opacity = 1



# Story Controller
Utils.delay 0, ->
	seekersMove()
	
	
	Utils.delay 2, -> 
		notificationEnters.start()
		
		
		Utils.delay 1.5, -> 
			touch(1337, 370)
			
			Utils.delay .1, ->
				notificationExits.start()
				
			
				Utils.delay .1, ->
					partiesExit()
		
				
					Utils.delay 1.8, ->
						chatEnters()
						
						
						Utils.delay 1, ->
							africanusMessage()
							
							
							Utils.delay 1.3, ->
								siavashMessage()
							
							
								Utils.delay .7, ->
									typingSending()
									touch(1180, 760)
						
					
	
	