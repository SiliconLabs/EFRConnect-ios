//
//  ProgressStyleKit.swift
//  ShowSomeProgress
//
//  Created by Alexander Kasimir on 04.08.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class ProgressStyleKit : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawProgressBarDisplay(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 136, height: 16), resizing: ResizingBehavior = .aspectFit, progress: CGFloat = 0.723, showTriangle: Bool = true, progressColorRed: CGFloat = 0, progressColorGreen: CGFloat = 0.475, progressColorBlue: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 136, height: 16), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 136, y: resizedFrame.height / 16)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 136, resizedFrame.height / 16)



        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.23)
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowBlurRadius = 1

        //// Variable Declarations
        let percentText = "\(Int(round(round(progress * 100))))" + "%"
        let progressWidth: CGFloat = 136 * progress
        let progressWidthOffset: CGFloat = progressWidth - 3.5
        let progressVisible = progress > 0
        let progressBarColor = UIColor(red: progressColorRed, green: progressColorGreen, blue: progressColorBlue, alpha: 1)

        //// Rectangle 2 Drawing
        context.saveGState()
        context.setAlpha(0.2)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 136, height: 9), cornerRadius: 3)
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        progressBarColor.setFill()
        rectangle2Path.fill()
        context.restoreGState()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Group
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Rectangle 3
        let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 136, height: 9), cornerRadius: 3)
        rectangle3Path.addClip()


        if (progressVisible) {
            //// Rectangle Drawing
            let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: progressWidth, height: 9), cornerRadius: 3)
            progressBarColor.setFill()
            rectanglePath.fill()
        }


        context.endTransparencyLayer()
        context.restoreGState()


        //// Text Drawing
        let textRect = CGRect(x: 3, y: 0, width: 130, height: 9)
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: UIFont.systemFont(ofSize: 7),
            .foregroundColor: UIColor.black,
            .paragraphStyle: textStyle,
        ] as [NSAttributedString.Key: Any]

        let textTextHeight: CGFloat = percentText.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        percentText.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()


        if (showTriangle) {
            //// Polygon Drawing
            context.saveGState()
            context.translateBy(x: progressWidthOffset, y: 9.5)

            let polygonPath = UIBezierPath()
            polygonPath.move(to: CGPoint(x: 3.5, y: 0))
            polygonPath.addLine(to: CGPoint(x: 6.53, y: 5.25))
            polygonPath.addLine(to: CGPoint(x: 0.47, y: 5.25))
            polygonPath.close()
            progressBarColor.setFill()
            polygonPath.fill()

            context.restoreGState()
        }
        
        context.restoreGState()

    }

    @objc dynamic public class func drawProgressCircleDisplay(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 140, height: 140), resizing: ResizingBehavior = .aspectFit, progress: CGFloat = 0.723, showTriangle: Bool = true, progressColorRed: CGFloat = 0, progressColorGreen: CGFloat = 0.475, progressColorBlue: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 140, height: 140), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 140, y: resizedFrame.height / 140)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 140, resizedFrame.height / 140)



        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.23)
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowBlurRadius = 1

        //// Variable Declarations
        let progressEndAngle: CGFloat = progress == 1 ? 0.001 : 360 * (1 - progress)
        let percentText = "\(Int(round(round(progress * 100))))" + "%"
        let progressBarColor = UIColor(red: progressColorRed, green: progressColorGreen, blue: progressColorBlue, alpha: 1)

        //// Text Drawing
        let textRect = CGRect(x: 10, y: 56, width: 130, height: 28)
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: UIFont.systemFont(ofSize: 31),
            .foregroundColor: UIColor.black,
            .paragraphStyle: textStyle,
        ] as [NSAttributedString.Key: Any]

        let textTextHeight: CGFloat = percentText.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        percentText.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()


        //// progressRingBackground Drawing
        context.saveGState()
        context.translateBy(x: 70, y: 70)
        context.rotate(by: -90 * CGFloat.pi/180)

        context.saveGState()
        context.setAlpha(0.2)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        let progressRingBackgroundPath = UIBezierPath(ovalIn: CGRect(x: -60, y: -60, width: 120, height: 120))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
//        progressBarColor.setStroke()
        progressRingBackgroundPath.lineWidth = 7.5
        progressRingBackgroundPath.stroke()
        context.restoreGState()

        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()


        //// Oval Drawing
        context.saveGState()
        context.translateBy(x: 70, y: 70)
        context.rotate(by: -90 * CGFloat.pi/180)

        let ovalRect = CGRect(x: -60, y: -60, width: 120, height: 120)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: 0 * CGFloat.pi/180, endAngle: -progressEndAngle * CGFloat.pi/180, clockwise: true)

        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        progressBarColor.setStroke()
        ovalPath.lineWidth = 7.5
        ovalPath.lineCapStyle = .round
        ovalPath.stroke()
        context.restoreGState()

        context.restoreGState()


        if (showTriangle) {
            //// Polygon Drawing
            context.saveGState()
            context.translateBy(x: 70, y: 70)
            context.rotate(by: -progressEndAngle * CGFloat.pi/180)

            let polygonPath = UIBezierPath()
            polygonPath.move(to: CGPoint(x: 0, y: -54))
            polygonPath.addLine(to: CGPoint(x: 5.63, y: -43.5))
            polygonPath.addLine(to: CGPoint(x: -5.63, y: -43.5))
            polygonPath.close()
            progressBarColor.setFill()
            polygonPath.fill()

            context.restoreGState()
        }
        
        context.restoreGState()

    }

    @objc dynamic public class func drawProgressCircleDisplayWithTicks(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 140, height: 140), resizing: ResizingBehavior = .aspectFit, progress: CGFloat = 0.723, showTriangle: Bool = true, progressColorRed: CGFloat = 0, progressColorGreen: CGFloat = 0.475, progressColorBlue: CGFloat = 1) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 140, height: 140), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 140, y: resizedFrame.height / 140)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 140, resizedFrame.height / 140)



        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.23)
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowBlurRadius = 1

        //// Variable Declarations
        let progressEndAngle: CGFloat = progress == 1 ? 0.001 : 360 * (1 - progress)
        let percentText = "\(Int(round(round(progress * 100))))" + "%"
        let progressBarColor = UIColor(red: progressColorRed, green: progressColorGreen, blue: progressColorBlue, alpha: 1)

        //// Text Drawing
        let textRect = CGRect(x: 10, y: 56, width: 130, height: 28)
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: UIFont.systemFont(ofSize: 31),
            .foregroundColor: UIColor.black,
            .paragraphStyle: textStyle,
        ] as [NSAttributedString.Key: Any]

        let textTextHeight: CGFloat = percentText.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        percentText.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()


        //// progressRingBackground Drawing
        context.saveGState()
        context.translateBy(x: 70, y: 70)
        context.rotate(by: -90 * CGFloat.pi/180)

        let progressRingBackgroundPath = UIBezierPath(ovalIn: CGRect(x: -60, y: -60, width: 120, height: 120))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        UIColor.black.setStroke()
        progressRingBackgroundPath.lineWidth = 5.5
        context.saveGState()
        context.setLineDash(phase: 0, lengths: [1, 5])
        progressRingBackgroundPath.stroke()
        context.restoreGState()
        context.restoreGState()

        context.restoreGState()


        //// Oval Drawing
        context.saveGState()
        context.translateBy(x: 70, y: 70)
        context.rotate(by: -90 * CGFloat.pi/180)

        let ovalRect = CGRect(x: -60, y: -60, width: 120, height: 120)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: 0 * CGFloat.pi/180, endAngle: -progressEndAngle * CGFloat.pi/180, clockwise: true)

        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        progressBarColor.setStroke()
        ovalPath.lineWidth = 7.5
        ovalPath.lineCapStyle = .round
        ovalPath.stroke()
        context.restoreGState()

        context.restoreGState()


        if (showTriangle) {
            //// Polygon Drawing
            context.saveGState()
            context.translateBy(x: 70, y: 70)
            context.rotate(by: -progressEndAngle * CGFloat.pi/180)

            let polygonPath = UIBezierPath()
            polygonPath.move(to: CGPoint(x: 0, y: -54))
            polygonPath.addLine(to: CGPoint(x: 5.63, y: -43.5))
            polygonPath.addLine(to: CGPoint(x: -5.63, y: -43.5))
            polygonPath.close()
            progressBarColor.setFill()
            polygonPath.fill()

            context.restoreGState()
        }
        
        context.restoreGState()

    }




    @objc(ProgressStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
