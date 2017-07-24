;;; alarm.el --- Alarm

;; Copyright (C) 2017, Emacs guys, all rights reserved.

;; Author: Kevim Jiang <wenlin1988@126.com>
;; Version: 20170724.1502
;; Keywords: alarm
;; Maintainer: Kevin Jaing <wenlin1988@126.com>
;; Created: 2017-07-24 12:00:00

;;; Commentary:

;; require alarm in you init.el: `(require 'alarm)'
;; Set an alarm with `alarm-clock', and enter the time;
;; cancel the alarm with `alarm-clock-cancel'

;;; Code:

(defvar alarm-clock-timer nil
  "Keep timer so that the user can cancel the alerm.")

(defun alarm-ding3 ()
  "Play 3 times ding."
  (dotimes (n 3)
    (play-sound-file "alarm.wav")))

;;;###autoload
(defun alarm-clock-cancel ()
  "Cancel the alarm clock."
  (interactive)
  (cancel-timer alarm-clock-timer))

;;;###autoload
(defun alarm-clock ()
  "Set an alarm.
The time format is the same accepted by `run-at-time'.
For example 12:00am."
  (interactive)
  (let ((time (read-string "Time(example, 12:00am): ")))
    (setq alarm-clock-timer (run-at-time time nil 'alarm-ding3))))

(provide 'alarm)

;;; alarm.el ends here
