const player = videojs("my-video", {
  autoplay: true,
  controlBar: {
    pictureInPictureToggle: false,
  },
});
var controlPanel = player.controlBar;

var videoUrlObj = location.href.split("/");
var lastObj = videoUrlObj.length;
var videoId = location.href.split("/")[--lastObj];

var prevBtn = controlPanel.addChild("button", {
  className: "vjs-text-visible",
});
prevBtn.addClass("prev-btn");
var prevBtnDOM = prevBtn.el();
function prevBtnOn() {
  if (Number(videoId) != 1) {
    window.location.href = Number(--videoId);
  }
}

prevBtn.on("pointerup", prevBtnOn);

var nextBtn = controlPanel.addChild("button", {
  className: "vjs-text-visible",
});
nextBtn.addClass("next-btn");
var nextBtnDOM = nextBtn.el();
function nextBtnOn() {
  window.location.href = Number(++videoId);
}

nextBtn.on("pointerup", nextBtnOn);

var complaintBtn = controlPanel.addChild("button", {
  className: "vjs-text-visible",
});
complaintBtn.addClass("complaint-btn");
let complaintBtnDOM = complaintBtn.el();
function complaintBtnOn() {
  let ask = confirm(
    "You can report all errors to the channel administrator.\nhttps://t.me/elmorestreamit\n\nOpen an administrator profile?"
  );
  if (ask == true) {
    window.open("https://t.me/elmorestreamit");
  }
}

complaintBtn.on("pointerup", complaintBtnOn);

var loopBtn = controlPanel.addChild("button", {
  className: "vjs-text-visible",
});
loopBtn.addClass("loop-btn");
var loopBtnDOM = loopBtn.el();
function loopOn() {
  // Enable/Disable replay mode
  let yesOrNo = player.loop() == false ? true : false;
  player.loop(yesOrNo);
  console.log(player.loop());
  // Change style replay button
  let onOrOff =
    loopBtnDOM.style.backgroundImage ==
    'url("/media/videoplayer/repeatOff.svg")'
      ? 'url("/media/videoplayer/repeat.svg")'
      : 'url("/media/videoplayer/repeatOff.svg")';
  loopBtnDOM.style.backgroundImage = onOrOff;
  console.log(loopBtnDOM.style.backgroundImage);
}

loopBtn.on("pointerup", loopOn);



// Skip video function
function skipTo() {
  const params = new URLSearchParams(window.location.search);
  const time = params.get("t"); // Получаем параметр "time"
  return time;
}

player.ready(() => {
  const time = skipTo();
  if (time) {
    player.currentTime(time);
    player.play();
  }
});
